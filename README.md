# Todo List

Super simple todo app built in Python.

## Prerequisites

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
