from fastapi import FastAPI
from db import database, Items
app = FastAPI(title="FastAPI, Docker")


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