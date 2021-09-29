PRAGMA foreign_keys = ON;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions.id
  FOREIGN KEY (user_id) REFERENCES users.id
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (parent_reply_id) REFERENCES replies.id
  FOREIGN KEY (user_id) REFERENCES users.id
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions.id
  FOREIGN KEY (user_id) REFERENCES users.id
);

INSERT INTO
  users (fname, lname)
VALUES
 ('David', 'Chan'),  ('Pam', 'Tenney');

INSERT INTO
  questions (title, body)
VALUES
  ('David''s Question', 'How old is the moon?');


  --INSERT INTO
 -- professors (first_name, last_name, department_id)
--VALUES
  --('Albert', 'Einstein', (SELECT id FROM departments WHERE name = 'physics')),
  --('Kurt', 'Godel', (SELECT id FROM departments WHERE name = 'mathematics'));