CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50),
    team_abbrev VARCHAR(10),
    city VARCHAR(50),
    state CHAR(2),
    conference VARCHAR(50),
    head_coach VARCHAR(50)
);
