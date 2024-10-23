DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL, 
    city TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height DECIMAL (5, 2),
    current_team_id INT NOT NULL
);
  
CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INT NOT NULL,
    match_id INT NOT NULL
    );

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    );

CREATE TABLE matches
( 
    id SERIAL PRIMARY KEY,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INT NOT NULL,
    head_referee_id INT NOT NULL,
    assistant_referee_1_id INT NOT NULL,
    assistant_referee_2_id INT NOT NULL
    );

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INT NOT NULL,
    match_id INT NOT NULL,
    result VARCHAR(4) CHECK (result IN ('win', 'loss', 'draw'))
);

CREATE TABLE lineups
(
   id SERIAL PRIMARY KEY,
   player_id INT NOT NULL,
   match_id INT NOT NULL
);

CREATE TABLE season 
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

INSERT INTO teams (name, city)
VALUES 
('Florida Falcons', 'Miami'),
('Texas Tornadoes', 'Dallas'),
('California Condors', 'Los Angeles');

INSERT INTO players (name, birthday, height, current_team_id)
VALUES 
('John Doe', '1990-05-14', 5.5, 1),
('David Smith', '1992-08-20',6.3, 1),
('Michael Johnson', '1988-03-02', 5.7, 1),
('Chris Evans', '1991-12-12', 6.2, 2),
('Alex Brown', '1993-07-18', 6.1, 2),
('Matt Green', '1995-01-30', 5.6, 2),
('Lucas White', '1987-09-22', 6.0, 3),
('Ryan Black', '1994-04-05', 5.8, 3),
('James Clark', '1996-06-10', 5.5, 3),
('Tom Hall', '1989-11-11', 5.9, 1),
('Daniel King', '1992-02-25', 6.4, 2),
('George Wright', '1993-10-15', 5.9, 3);

INSERT INTO goals (id, player_id, match_id)
VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 4, 2),
(4, 5, 2),
(5, 7, 3),
(6, 9, 3);

INSERT INTO referees (id, name)
VALUES 
(1, 'Mark Johnson'),
(2, 'Julian Doe'),
(3, 'James Lee'),
(4, 'David Brown'),
(5, 'George Thompson'),
(6, 'Michael Clark');

INSERT INTO matches (home_team_id, away_team_id, date, start_time, season_id, head_referee_id, assistant_referee_1_id, assistant_referee_2_id)
VALUES
  (1, 2, '2023-10-22', '19:30:00', 1, 101, 102, 103),
  (3, 4, '2023-10-23', '15:00:00', 1, 104, 105, 106),
  (5, 6, '2023-10-24', '12:00:00', 1, 107, 108, 109),
  (7, 8, '2023-10-25', '18:00:00', 1, 110, 111, 112),
  (9, 10, '2023-10-26', '14:00:00', 1, 113, 114, 115),
  (11, 12, '2023-10-27', '11:00:00', 1, 116, 117, 118),
  (13, 14, '2023-10-28', '17:00:00', 1, 119, 120, 121);

INSERT INTO results (team_id, match_id, result)
VALUES
  (1, 1, 'win'),
  (2, 1, 'loss'),
  (3, 2, 'draw'),
  (4, 2, 'win'),
  (5, 3, 'loss'),
  (6, 3, 'draw'),
  (7, 4, 'win'),
  (8, 4, 'loss'),
  (9, 5, 'draw'),
  (10, 5, 'win');

INSERT INTO lineups (player_id, match_id)
VALUES
  (101, 1),
  (102, 1),
  (103, 1),
  (104, 2),
  (105, 2),
  (106, 2),
  (107, 3),
  (108, 3),
  (109, 3),
  (110, 4);

INSERT INTO season (start_date, end_date)
VALUES
  ('2023-08-15', '2024-05-15'),
  ('2024-08-16', '2025-05-16'),
  ('2025-08-17', '2026-05-17'),
  ('2026-08-18', '2027-05-18'),
  ('2027-08-19', '2028-05-19'),
  ('2028-08-20', '2029-05-20');