import sqlite3

def create_db():
# читаємо файл зі скриптом для створення БД
    with open('create_tables.sql', 'r') as f:
        sql = f.read()

# створюємо з'єднання з БД (якщо файлу з БД немає, він буде створений)
    with sqlite3.connect('tasks.db') as con:
        # включаємо зовнішні ключі
        con.execute("PRAGMA foreign_keys = ON;")
        cur = con.cursor()
# виконуємо скрипт із файлу, який створить таблиці в БД
        cur.executescript(sql)

if __name__ == "__main__":
    create_db()