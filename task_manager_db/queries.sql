
-- Отримати всі завдання конкретного користувача за user_id
SELECT id, title, description, status_id
FROM tasks
WHERE user_id = 1;

-- Отримати всі завдання конкретного користувача з його ім'ям
SELECT t.id AS task_id, t.title, t.description, t.status_id, u.fullname AS user_name
FROM tasks t
JOIN users u ON t.user_id = u.id
WHERE t.user_id = 5;

-- Отримати всі завдання зі статусом 'new'
SELECT
    id AS task_id, title, description, user_id
FROM tasks
WHERE status_id = (
    SELECT id
    FROM status
    WHERE name = 'new'
);
-- Оновити статус конкретної задачі по id на 'in progress'
UPDATE tasks
SET status_id = (
    SELECT id
    FROM status
    WHERE name = 'in progress'
)
WHERE id = 7; 

--  Отримати назву статусу для кожного завдання конкретного користувача
SELECT t.id, t.title, t.description, s.name AS status_name, t.user_id
FROM tasks t
JOIN status s ON t.status_id = s.id
WHERE t.user_id = 1;

-- Отримати користувачів без жодної задачі
SELECT id, fullname, email
FROM users
WHERE id NOT IN (
    SELECT DISTINCT user_id
    FROM tasks
);

-- Додаємо нову задачу для користувача з user_id = 1
INSERT INTO tasks (title, description, status_id, user_id)
VALUES ('Learn SQL','Complete SQL practice exercises',
    (SELECT id FROM status WHERE name = 'new'),
    1                                      
);

-- Отримати всі завдання, які ще не завершені
SELECT t.id AS task_id, t.title,t.description, u.fullname AS user_name, s.name AS status_name
FROM tasks t
JOIN users u ON t.user_id = u.id
JOIN status s ON t.status_id = s.id
WHERE s.name != 'completed';

-- Видалити задачу з id = 7
DELETE FROM tasks
WHERE id = 7;


-- Знайти користувачів, email яких містить 'mail.com'
SELECT id, fullname, email
FROM users
WHERE email LIKE '%example.net';

-- Змінити ім'я користувача по id  на 'John Higgins'
UPDATE users
SET fullname = 'John Higgins'
WHERE id = 1;
-- Змінити ім'я користувача по email на 'Matthew Stvens'
UPDATE users
SET fullname = 'Matthew Stvens'
WHERE email = 'maysmatthew@example.com';

-- Кількість задач по кожному статусу
SELECT s.name AS status_name, COUNT(t.id) AS tasks_count
FROM status s
LEFT JOIN tasks t ON t.status_id = s.id
GROUP BY s.name;
-- Отримати задачі користувачів з доменом '@example.com'
SELECT t.id AS task_id, t.title, t.description, u.fullname AS user_name, u.email
FROM tasks t
JOIN users u ON t.user_id = u.id
WHERE u.email LIKE '%@example.com';

-- Отримати задачі без опису
SELECT t.id AS task_id, t.title, t.user_id, u.fullname AS user_name
FROM tasks t
JOIN users u ON t.user_id = u.id
WHERE t.description IS NULL OR t.description = '';

-- Користувачі та їхні задачі зі статусом 'in progress'
SELECT u.id AS user_id, u.fullname AS user_name, t.id AS task_id, t.title, t.description
FROM users u
INNER JOIN tasks t ON t.user_id = u.id
INNER JOIN status s ON t.status_id = s.id
WHERE s.name = 'in progress';


-- Кількість задач у кожного користувача
SELECT u.id AS user_id, u.fullname AS user_name, COUNT(t.id) AS tasks_count
FROM users u
LEFT JOIN tasks t ON t.user_id = u.id
GROUP BY u.id, u.fullname
ORDER BY tasks_count DESC;







