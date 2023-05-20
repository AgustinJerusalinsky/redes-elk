# pull the official docker image
FROM python:3.11.1-slim

# set work directory
WORKDIR /app

# set env variables: PYTHONDONTWRITEBYTECODE 1  Prevents Python from writing pyc files to disc AND PYTHONUNBUFFERED 1 Prevents Python from buffering stdout and stderr 
# ENV PYTHONDONTWRITEBYTECODE 1 
# ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY ./app .

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0" ,"--port", "8000"]