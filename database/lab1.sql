--2
CREATE TABLE users (
    id INT,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

--3
ALTER TABLE users
ADD isAdmin int;

--4
ALTER TABLE users
ALTER COLUMN isAdmin SET DATA TYPE BOOLEAN USING isadmin::boolean;
--5
ALTER TABLE users
ALTER isAdmin SET DEFAULT 'false';
SELECT * FROM users;
--6
ALTER TABLE users
ADD PRIMARY KEY (id);
--7
CREATE TABLE tasks(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INT
);

SELECT * FROM tasks;
SELECT * FROM users;
--8
DROP TABLE tasks;
--9
DROP DATABASE postgres;