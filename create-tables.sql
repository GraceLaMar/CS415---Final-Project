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
(1, 'Kaden', 'Johnson', 1, 'F', 'JR', 83, 200),
(1, 'Maximus', 'Gizzi', 2, 'G', 'GR', 73, 185),
(1, 'Cade', 'Brenner', 3, 'G', 'SO', 75, 190),
(1, 'Taden', 'Metzger', 4, 'G', 'FR', 74, 175),
(1, 'Drew', 'Goodline', 5, 'G', 'SR', 74, 165),
(1, 'Khamani', 'Smith', 10, 'F', 'SR', 77, 200),
(1, 'Romain', 'Bruwier', 11, 'F', 'SR', 81, 220),
(1, 'Miles', 'Good', 12, 'G', 'FR', 72, 165),
(1, 'Landon', 'Biegel', 15, 'F', 'SO', 77, 180),
(1, 'Lane', 'Sparks', 20, 'G', 'SR', 75, 185),
(1, 'Landen', 'Jordan', 23, 'F', 'SR', 81, 210),
(1, 'Jackson', 'Paul', 24, 'G', SR', 73, 175),
(1, 'Luke', 'LaGrange', 41, 'F', 'JR', 77, 195),
    
(2, 'DJ', 'Moore', 0, 'F', 'JR', 80, 190),
(2, 'Bright', 'Kari', 1, 'G', 'JR', 83, 210),
(2, 'Kyle', 'Sanders', 2, 'G', 'SR', 73, 190),
(2, 'Rocco', 'Muratori', 8, 'C', 'SO', 87, 255),
(2, 'Jaxson', 'Gould', 10, 'G', 'SO', 73, 190),
(2, 'Matthew', 'Brown', 11, 'F', 'SO', 78, 215),
(2, 'Peyton', 'Byrd', 13, 'F', 'FR', 73, 190),
(2, 'Connor', 'Hussong', 14, 'G', 'SO', 75, 150),
(2, 'Issac', 'Andrews', 20, 'G', 'FR', 73, 185),
(2, 'Griffin', 'Kliewer', 21, 'G', 'SR', 75, 190),
(2, 'Jake', 'Smith', 23, 'F', 'FR', 78, 215),
(2, 'Luke', 'Brown', 25, 'G', 'JR', 73, 175),
(2, 'Marcus', 'Ankney', 30, 'G', 'SO', 75, 185),
(2, 'Cliff', 'Gashumba', 33, 'F', 'SO', 78, 200),
(2, 'Caedmon', 'Bontrager', 35, 'F', 'SO', 79, 235),
    
(3, 'Payton', 'Baird', 0, 'G', 'FR', 77, 235),
(3, 'Jameir', 'Jefferson', 1, 'G', 'SO', 74, 235),
(3, 'Colin', 'Comer', 3, 'G', 'RS', 76, 235),
(3, 'Beau', 'Jacquay', 4, 'C', 'SO', 80, 235),
(3, 'Austin', 'Cripe', 5, 'G', 'RS', 75, 235),
(3, 'Andrew', 'Hedrick', 10, 'G', 'SO', 72, 235),
(3, 'Alex', 'Johnson', 13, 'G', 'FR', 76, 235),
(3, 'James', 'Anserson', 14, 'C', 'GR', 80, 235),
(3, 'Trent', 'Edwards', 21, 'G', 'GR', 76, 235),
(3, 'Alonas', 'Peciulis', 22, 'F', 'JR', 78, 235),
(3, 'Preston', 'Phillips', 23, 'F', 'GR', 80, 235),
(3, 'Luke', 'McBride', 24, 'G', 'SO', 73, 235),
(3, 'Ike', 'Umeh', 25, 'C', 'GR', 78, 235),
(3, 'Alex', 'Ellenson', 32, 'F', 'RS', 80, 235),
    
(4, 'Keshawn', 'McNeill', 0, 'G', 'SO', 74, 235),
(4, 'Branden', 'Northern', 2, 'G', 'JR', 72, 235),
(4, 'Joe', 'Reidy', 3, 'F', 'JR', 79, 235),
(4, 'Zane', 'Burke', 4, 'G', 'SR', 76, 235),
(4, 'Robert', 'Fry II', 5, 'G', 'SR', 73, 235),
(4, 'Luke', 'Almodovar', 10, 'G', 'SO', 74, 235),
(4, 'Matthew', 'Roettger', 11, 'G', 'FR', 74, 235),
(4, 'Eugene', 'Young Jr.', 13, 'G', 'FR', 77, 235),
(4, 'Chase', 'Newton', 14, 'G', 'SO', 73, 235),
(4, 'Sam', 'Johnson', 15, 'G', 'FR', 74, 235),
(4, 'Braeden', 'Messenger', 20, 'F', 'FR', 76, 235),
(4, 'Karson', 'Rogers', 21, 'F', 'FR', 78, 235),
(4, 'Jackson', 'Gowdy', 22, 'F', 'SR', 80, 235),
(4, 'Dorean', 'Hacker', 23, 'F', 'FR', 76, 235),
(4, 'Isaiah', 'Malone', 32, 'F', 'SO', 80, 235),
    
(5, 'DJ', 'Bryant', 2, 'G', 'GR', 69, NULL),
(5, 'Judah', 'Simfukwe', 5, 'G', 'JR', 73, NULL),
(5, 'Baran', 'Aslan', 11, 'G', 'SO', 75, NULL),
(5, 'Richard', 'Wilson', 12, 'G', '5th', 75, NULL),
(5, 'Jacob', 'Carlson', 13, 'G', 'JR', 75, NULL),
(5, 'Braden', 'Allen', 14, 'F', 'SO', 74, NULL),
(5, 'Kevin', 'Cota', 15, 'F', 'SO', 78, NULL),
(5, 'Deecon', 'Hill', 20, 'G', 'SO', 76, NULL),
(5, 'Saiveon', 'Williams', 21, 'F', 'JR', 77, NULL),
(5, 'Marcus', 'Northern', 23, 'G', 'SO', 72, NULL),
(5, 'Kahmi', 'Bracey', 30, 'G', 'SO', 71, NULL),
(5, 'Jacob', 'Eyler', 31, 'G', 'JR', 71, NULL),
(5, 'Juraj', 'Minarovjech', 34, 'F', 'SO', 77, NULL),
(5, 'JP', 'Jabbour', 50, 'C', 'JR', 77, NULL),
(5, 'Kenny', 'May', 55, 'F', 'FR', 76, NULL),
    
(6, 'Carter', 'Stoltzfus', 2, 'G', 'SR', 72, NULL),
(6, 'Alex', 'Darnell', 3, 'G', 'SR', 73, NULL),
(6, 'Cannen', 'Houser', 10, 'G', 'FR', 77, NULL),
(6, 'Marcus', 'Davidson', 11, 'G', 'SR', 73, NULL),
(6, 'Ian', 'Raasch', 12, 'F', 'SO', 78, NULL),
(6, 'Justin', 'DeGraaf', 13, 'F', 'SR', 79, NULL),
(6, 'Isaac', 'Schultz', 15, 'F', 'FR', 79, NULL),
(6, 'Hunter', 'Walston', 20, 'F', 'FR', 79, NULL),
(6, 'Caleb', 'Herrold', 21, 'G', 'SO', 77, NULL),
(6, 'Brycen', 'Graber', 22, 'G', 'SR', 75, NULL),
(6, 'Ian', 'Scott', 23, 'F', 'SR', 79, NULL),
(6, 'Brett', 'Sickafoose', 24, 'G', 'SR', 74, NULL), 
(6, 'Seth', 'Martin', 25, 'G', 'SO', 74, NULL),
(6, 'Gage', 'Sefton', 30, 'G', 'SO', 77, NULL),
(6, 'Cole', 'Hayworth', 32, 'F', 'FR', 78, NULL),

(7, 'Milton', 'Gage', 0, 'G', 'GR', 71, NULL),
(7, 'Bede', 'Lori', 1, 'G', 'RS', 75, NULL),
(7, 'Peyton', 'Heiss', 2, 'G', 'FR', 76, NULL),
(7, 'Isaiah', 'Brown', 3, 'F', 'FR', 78, NULL),
(7, 'Drew', 'Koning', 4, 'G', 'RS', 75, NULL),
(7, 'Grant', 'Burkholder', 5, 'G', 'SO', 69, NULL),
(7, 'Caleb', 'Schall', 10, 'G', 'SR', 70, NULL),
(7, 'Trent', 'Koning', 11, 'G', 'JR', 73, NULL),
(7, 'Mason', 'Harvey', 20, 'F', 'FR', 80, NULL),
(7, 'Junior', 'Kambomba', 23, 'G', 'FR', 75, NULL),
(7, 'Bailey', 'Conrad', 32, 'F', 'GR', 79, NULL),
(7, 'Carter', 'Jones', 34, 'F/G', 'SR', 77, NULL),
(7, 'Devin', 'Dreier', 40, 'F', 'SO', 79, NULL),

(8, 'Fletcher', 'Manhart', 0, 'G', 'SR', 71, 190),
(8, 'David', 'Cundiff', 1, 'G', 'FR', 72, 170),
(8, 'Travis', 'Grayson', 2, 'G', 'JR', 75, NULL),
(8, 'Shane', 'Rykse', 'G', 3, 'FR', 75, 190),
(8, 'Tyler', 'DeSimpelare', 4, 'G', 'JR', 75, 165),
(8, 'Warrick', 'Elder', 5, 'G', 'FR', 73, 165),
(8, 'Trey', 'Cottingham', 10, 'G', 'SR', 73, 180),
(8, 'Eli', 'White', 11, 'G', 'JR', 75, 190),
(8, 'Aden', 'Zank', 15, 'F', 'JR', 78, 200),
(8, 'Luke', 'Stuckey', 20, 'G', 'SO', 75, 185),
(8, 'Ty', 'Rykse', 21, 'F', 'JR', 79, 225),
(8, 'Jayden', 'Nimako', 22, 'F', 'FR', 78, 200),
(8, 'Kevyn', 'Robertson', 23, 'F', 'SR', 78, 205),
(8, 'Dante', 'Favor', 24, 'F', 'SO', 80, 215),
(8, 'Gabe', 'Newhof', 25, 'F', 'JR', 81, 225),

(9, 'Chaz', 'Harvey', 0, 'G', 'JR', 73, 185),
(9, 'Anton', 'Webb', 1, 'F', 'SR', 80, 210),
(9, 'Jackson', 'Ullom', 2, 'G', 'JR', 70, 180),
(9, 'Nate', 'Paarlberg', 3, 'F', 'JR', 78, 190),
(9, 'Kobe', 'Funderburk', 4, 'G', 'SR', 72, 170),
(9, 'Joey', 'Heaston', 10, 'G', 'FR', 74, 175),
(9, 'Ben', 'Michel', 12, 'F', 'JR', 78, 205),
(9, 'Levin', 'Smith', 13, 'C', 'FR', 83, 210),
(9, 'John', 'McLimore', 14, 'G', 'JR', 75, 195),
(9, 'Kaden', 'Fuhrmann', 15, 'G', 'SR', 76, 190),
(9, 'Carson', 'Miller', 20, 'G', 'JR', 74, 205),
(9, 'Noah', 'Choi', 21, 'G', 'SO', 73, 185),
(9, 'Izaiah', 'Day', 23, 'G', 'SO', 75, 175),













