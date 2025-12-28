# 📒 Task Manager SQLite Project

A simple Task Management System implemented with SQLite and Python.
The project demonstrates database design, table relationships, foreign keys, cascade deletion, data seeding, and SQL queries.

This project is intended for educational purposes and focuses on understanding relational databases and SQL fundamentals.

## Project Structure

* create_db.py — Script to create the database 
* create_tables.sql — SQL script to create database tables.
* seed.py — SQL queries according to the task requirements
* tasks.db — SQLite database file (created after running scripts)
* pyproject.toml — Poetry configuration

## 🛠 Technologies
* Python 3.13 
* SQLite (built-in Python database)  
* Poetry — dependency and virtual environment management
* Faker — generation of random test data 
* DBeaver — database visualization and query execution
---
## ⚡ Installation

1. Make sure you have **Python 3.13** installed  
2. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git 
```
3. Navigate to the project folder:
```bash
cd YOUR_REPO_NAME
```
4. Install dependencies using Poetry
```bash
poetry install
```
⚠️ All Poetry commands must be executed from the task_manager_db directory where pyproject.toml is located.

## 🚀 Usage
1) Create the database and tables
```bash
poetry run python create_db.py
```
This will create the tasks.db file and all required tables.

2) Fill the database with test data
```bash
poetry run python seed.py
```
The scripts seed.py:
* Clears existing data
* Inserts predefined task statuses
* Generates random users and tasks

## Run SQL queries
SQL queries required by the task are stored in queries.sql.
You can execute them using:

* DBeaver (recommended for visualization)
* Any SQLite-compatible SQL client

## 🔗 Database Schema
Database Schema (scripts create_tables.sql)
The database contains three tables:
* users — system users
* status — task statuses (new, in progress, completed)
* tasks — tasks assigned to users