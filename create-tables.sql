CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50),
    team_abbrev VARCHAR(10),
    city VARCHAR(50),
    state CHAR(2),
    conference VARCHAR(50),
    head_coach VARCHAR(50)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    jersey_number INT,
    position ENUM('G', 'F', 'C', 'G/F'),
    class_year ENUM('FR', 'SO', 'JR', 'SR', 'GR', 'RS'),
    height_inches INT,
    weight_lbs INT, 
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_date DATE NOT NULL,
    opponent VARCHAR(100) NOT NULL,
    location ENUM('Home', 'Away', 'Neutral') NOT NULL,
    team_score INT NOT NULL,
    opponent_score INT NOT NULL
);

CREATE TABLE PlayerStats (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    minutes_played INT DEFAULT 0,
    points INT DEFAULT 0,
    fg_made INT DEFAULT 0,
    fg_att INT DEFAULT 0,
    three_made INT DEFAULT 0,
    three_att INT DEFAULT 0,
    ft_made INT DEFAULT 0,
    ft_att INT DEFAULT 0,
    assists INT DEFAULT 0,
    rebounds INT DEFAULT 0,
    steals INT DEFAULT 0,
    blocks INT DEFAULT 0,
    turnovers INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE TeamStats (
    team_stat_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    game_id INT NOT NULL,
    points INT DEFAULT 0,
    fg_made INT DEFAULT 0,
    fg_attempted INT DEFAULT 0,
    three_made INT DEFAULT 0,
    three_attempted INT DEFAULT 0,
    ft_made INT DEFAULT 0,
    ft_attempted INT DEFAULT 0,
    rebounds INT DEFAULT 0,
    assists INT DEFAULT 0,
    steals INT DEFAULT 0,
    blocks INT DEFAULT 0,
    turnovers INT DEFAULT 0,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);


INSERT INTO Teams (team_name, team_abbrev, head_coach, city, state, conference)
VALUES
('Huntington University', 'HU', 'Kory Alford', 'Huntington', 'IN', 'Crossroads League'),
('Indiana Wesleyan University', 'IWU', 'Greg Tonega', 'Marion', 'IN', 'Crossroads League'),
('Bethel University', 'BU', 'Steve Drabyn', 'Mishawaka', 'IN', 'Crossroads League'),
('University of Saint Francis', 'USF', 'Chad LaCross', 'Fort Wayne', 'IN', 'Crossroads League'),
('Goshen College', 'GC', 'Kyle Capps', 'Goshen', 'IN', 'Crossroads League'),
('Grace College', 'GC', 'Scott Moore', 'Winona Lake', 'IN', 'Crossroads League'),
('Mount Vernon Nazarene University', 'MVNU', 'Jared Ronai', 'Mount Vernon', 'OH', 'Crossroads League'),
('Spring Arbor University', 'SAU', 'Ryan Cottingham', 'Spring Arbor', 'MI', 'Crossroads League'),
('Taylor University', 'TU', 'Austin Peters', 'Upland', 'IN', 'Crossroads League'),
('Marian University', 'MU', 'Pat Knight', 'Indianapolis', 'IN', 'Crossroads League');

INSERT INTO Players (team_id, first_name, last_name, jersey_number, position, class_year, height_inches, weight_lbs)
VALUES
('1', 'Kaden', 'Johnson', '1', 'F', 'JR', '83', '200')
('1', 'Maximus', 'Gizzi', '2', 'G', 'GR', '73', '185')
('1', 'Cade', 'Brenner', '3', 'G', 'SO', '75', '190')
('1', 'Taden', 'Metzger', '4', 'G', 'FR', '74', '175')
('1', 'Drew', 'Goodline', '5', 'G', 'SR', '74', '165')
('1', 'Khamani', 'Smith', '10', 'F', 'SR', '77', '200')
('1', 'Romain', 'Bruwier', '11', 'F', 'SR', '81', '220')
('1', 'Miles', 'Good', '12', 'G', 'FR', '72', '165')
('1', 'Landon', 'Biegel', '15', 'F', 'SO', '77', '180')
('1', 'Lane', 'Sparks', '20', 'G', 'SR', '75', '185')
('1', 'Landen', 'Jordan', '23', 'F', 'SR', '81', '210')
('1', 'Jackson', 'Paul', '24', 'G', SR', '73', '175')
('1', 'Luke', 'LaGrange', '41', 'F', 'JR', '77', '195')
('2', 'DJ', 'Moore', '0', 'F', 'JR', '80', '190')
('2', 'Bright', 'Kari', '1', 'G', 'JR', '83', '210')
('2', 'Kyle', 'Sanders', '2', 'G', 'SR', '73', '190')
('2', 'Rocco', 'Muratori', '8', 'C', 'SO', '87', '255')
('2', 'Jaxson', 'Gould', '10', 'G', 'SO', '73', '190')
('2', 'Matthew', 'Brown', '11', 'F', 'SO', '78', '215')
('2', 'Peyton', 'Byrd', '13', 'F', 'FR', '73', '190')
('2', 'Connor', 'Hussong', '14', 'G', 'SO', '75', '150')
('2', 'Issac', 'Andrews', '20', 'G', 'FR', '73', '185')
('2', 'Griffin', 'Kliewer', '21', 'G', 'SR', '75', '190')
('2', 'Jake', 'Smith', '23', 'F', 'FR', '78', '215')
('2', 'Luke', 'Brown', '25', 'G', 'JR', '73', '175')
('2', 'Marcus', 'Ankney', '30', 'G', 'SO', '75', '185')
('2', 'Cliff', 'Gashumba', '33', 'F', 'SO', '78', '200')
('2', 'Caedmon', 'Bontrager', '35', 'F', 'SO', '79', '235')


















