from fastapi import FastAPI
from db import database, Items
import logging
import os
app = FastAPI(title="FastAPI, Docker")

# Get the current directory
current_directory = os.getcwd()

# Specify the log file path
log_file_path = os.path.join(current_directory, "logs", "app.log")

# Configure logging
logging.basicConfig(
    filename=log_file_path,
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)s %(module)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S"
)

formatter = logging.Formatter("%(asctime)s %(levelname)s %(module)s: %(message)s",datefmt="%Y-%m-%d %H:%M:%S")
file_handler = logging.FileHandler(log_file_path)
file_handler.setFormatter(formatter)
uvicorn_access_logger = logging.getLogger("uvicorn")
uvicorn_access_logger.addHandler(file_handler)

@app.get("/")
def read_root():
    return {"msg": "Hello World!"}

@app.on_event("shutdown")
async def shutdown():
    if database.is_connected:
        await database.disconnect()

@app.on_event("startup")
async def startup():
    if not database.is_connected:
        await database.connect()
    # create a dummy entry
    await Items.objects.get_or_create(name="test", price=10.0)

@app.get("/items")
async def read_all_items():
    return await Items.objects.all()