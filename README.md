# Todo List

Super simple todo app built in Python.

The instructions in this README file assume you are running the application on an Ubuntu or Debian machine.

## Prerequisites

First, install pip:

```bash
sudo apt update
sudo apt install python3 python3-pip -y
```

Install the pip requirements (make sure you're in the repo root directory):

```bash
pip3 install -r requirements.txt
```

You need to set the database URI that the app needs to connect to and a secret key. This is done via *environment variables*.

```bash
export DATABASE_URI=[YOUR_DB_URI]
export SECRET_KEY=[YOUR_SECRET_KEY]
```

The secret key can be any value.

The Database URI can be set to an in-memory database using SQLite:

```bash
export DATABASE_URI=sqlite:///data.db
```

You will also need to run the `create.py` python script to generate the database schema.

```bash
python3 create.py
```

## Running the App

Simply enter the following in your bash terminal:

```bash
python3 app.py
```

The website will be accessible on port 5000 on your machine's IP.

Make sure the machine's firewall rules allow network traffic on port 5000.

To stop the application, enter `ctrl+C`.

## Testing the Application

Make sure the current working directory is this repository.

Install `pytest`:

```bash
sudo apt update 
sudo apt install python3 python3-pip -y
pip3 install pytest pytest-cov
```

Run `pytest` and generate test and coverage reports:

```bash
python3 -m pytest --doctest-modules --junitxml=junit/test-results.xml --cov=application --cov-report=xml --cov-report=html
```

This will generate reports that are readable by JUnit and Cobertura.

