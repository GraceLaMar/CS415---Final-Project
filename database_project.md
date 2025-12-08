# CS415 Database Project

## Database Summary Report

### Project Overview

This database is designed to model NAIA college basketball teams and show how each team progresses over multiple games, seasons, and rosters. 
The system is organized into four tables: `Teams`, `Players`, `Games`, and `SeasonStats`. Each table stores a small section of data specific to their team. 
Teams represents NAIA college mens basketball teams; Players represents everyone on the teams roster; Games show the results of each head to head matchup;
and SeasonStats shows each teams preformance in different statistical categories over a season. 

I used a fully normalized structure so that each table is stored without repetitive data. Since I decided to not store player names or team names in my Games and SeasonStats tables, 
I was able to reference my data through a forigen key. This made accessing my data a lot easier. It also allowed changes to be a lot easier because I only had to make them in one spot istead of multiple spots. 
For example, last year, Huntington University's head coach was Kory Alford. Since we got a new coach this year, the data would only need to be changed in one spot. 

Another design choice I made was to make a SeasonStats table instead of a TeamStats table. I originally did this and then shortly realized this would require a lot of data. If I were to do this for every team in my database I would have needed to enter over 2400 TeamStats in. 
SeasonStats allows for you to get a glimpse into how the team did over the season. It may prevent you from getting the full picture but statistics are still an important measure of preformance for teams.

`Teams`stores important informtion about each team that helps distingush it from other teams. These fields that are stored are team name, abbreviation, city, state, conference, and head coach. This table is central to the database as it the main reference table for each of the other tables. Each table links back to the Teams table. 

`Players` stores all information about each member of the team including first name, last name, jersey number, position, class year, height, and weight. Each player is part of one team through the `team_id` foreigen key. This table shows important information about each player that helps show how each team functions. 

`Games` stores data for each game played by the crossroads league teams including the game date, the home team, the away tean, and the final score for eeach team. This table uses forigen keys to reference teams rather than storing each team name. This table is important for tracking outcomes and shows important information on head to head matchups. 

`SeasonStats` stores statistical data for each team to represent their whole season including their average points per game, field goal percentage, three point percentage, free throw percentage, rebounds per game, assists per game, steals per game, blocks per game, turnovers per game, and their overall season record. Each row of data will link a team to a specific season. This table is essential to the analysis because it allows you to compare teams by the numbers so you can get a sense for how good or bad the teams are. 



## Database ER Model

```mermaid
erDiagram

    Teams {
        INT team_id PK
        VARCHAR(50) team_name
        VARCHAR(10) team_abbrev
        VARCHAR(50) city
        CHAR(2) state
        VARCHAR(50) conference
        VARCHAR(50) head_coach
    }

    Players {
        INT player_id PK
        INT team_id FK
        VARCHAR(50) first_name
        VARCHAR(50) last_name
        INT jersey_number
        VARCHAR(10) position
        VARCHAR(10) class_year
        INT height_inches
        INT weight_lbs
    }

    Games {
        INT game_id PK
        DATE game_date
        INT home_team_id FK
        INT away_team_id FK
        INT home_score
        INT away_score
    }

    SeasonStats {
        INT season_stat_id PK
        INT team_id FK
        YEAR season
        DECIMAL points_avg
        DECIMAL fg_pct
        DECIMAL three_pct
        DECIMAL ft_pct
        DECIMAL rebounds_avg
        DECIMAL assists_avg
        DECIMAL steals_avg
        DECIMAL blocks_avg
        DECIMAL turnovers_avg
        VARCHAR(10) overall_record
        VARCHAR(10) leauge_record
    }

    Teams ||--o{ Players : has_players
    Teams ||--o{ SeasonStats : has_season_stats
    Teams ||--o{ Games : is_home_team_in
    Teams ||--o{ Games : is_away_team_in

    Players }o--|| Teams : belongs_to
    SeasonStats }o--|| Teams : stats_for
    Games }o--|| Teams : home_team
    Games }o--|| Teams : away_team

```


