PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('David', 'Chan'),  ('Pam', 'Tenney');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('David''s Question', 'How old is the moon?', 1),
  ('David''s New Question', 'How old is the sun?', 1),
  ('Pam''s Question', 'Can I have a T-Rex?', 2);

INSERT INTO
  question_follows (question_id, user_id)
VALUES 
  ((SELECT id FROM questions WHERE title = 'David''s Question' AND body = 'How old is the moon?'),
  (SELECT id FROM users WHERE fname = 'David' AND lname = 'Chan')),

  ((SELECT id FROM questions WHERE title = 'Pam''s Question' AND body = 'Can I have a T-Rex?'),
  (SELECT id FROM users WHERE fname = 'Pam' AND lname = 'Tenney'));

INSERT INTO 
  replies (question_id, parent_reply_id, user_id, body)
VALUES
  (2, NULL, 1, 'No'),
  (2, 1, 2, 'Aw please'),
  (2, 1, 2, 'Fine, I want a pony');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 1),
  (1, 2);

  -- cat import_db.sql | sqlite3 questions.db

