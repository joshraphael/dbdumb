CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT
);

INSERT INTO tasks (title, status, priority, description) VALUES('test', 1, 1, "description");