import sqlite3
from faker import Faker
import random

DB_PATH = "tasks.db"

fake = Faker()

def seed_db():
    with sqlite3.connect(DB_PATH) as con:
        con.execute("PRAGMA foreign_keys = ON;")
        cur = con.cursor()

        # ---------- ОЧИСТКА ТАБЛИЦЬ ----------
        cur.execute("DELETE FROM tasks;")
        cur.execute("DELETE FROM users;")
        cur.execute("DELETE FROM status;")

        # ---------- STATUS ----------
        statuses = ["new", "in progress", "completed"]
        for status in statuses:
            cur.execute(
                "INSERT INTO status (name) VALUES (?)",
                (status,)
            )

        # ---------- USERS ----------
        users_count = 5
        for _ in range(users_count):
            cur.execute(
                "INSERT INTO users (fullname, email) VALUES (?, ?)",
                (fake.name(), fake.email())
            )

        # ---------- TASKS ----------
        # отримуємо id користувачів і статусів
        cur.execute("SELECT id FROM users;")
        user_ids = [row[0] for row in cur.fetchall()]

        cur.execute("SELECT id FROM status;")
        status_ids = [row[0] for row in cur.fetchall()]

        tasks_count = 10
        for _ in range(tasks_count):
            cur.execute(
                """
                INSERT INTO tasks (title, description, status_id, user_id)
                VALUES (?, ?, ?, ?)
                """,
                (
                    fake.sentence(nb_words=4),
                    fake.text(),
                    random.choice(status_ids),
                    random.choice(user_ids)
                )
            )

        con.commit()

if __name__ == "__main__":
    seed_db()
    print("✅ База даних наповнена тестовими даними")
