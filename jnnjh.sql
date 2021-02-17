IF OBJECT_ID('dbo.WINNERS') IS NOT NULL
DROP TABLE dbo.WINNERS;
IF OBJECT_ID('dbo.RACES') IS NOT NULL
DROP TABLE dbo.RACES;
IF OBJECT_ID('dbo.TRACKS') IS NOT NULL
DROP TABLE dbo.TRACKS;
IF OBJECT_ID('dbo.DRIVERS') IS NOT NULL
DROP TABLE dbo.DRIVERS;
IF OBJECT_ID('dbo.CONSTRUCTORS') IS NOT NULL
DROP TABLE dbo.CONSTRUCTORS;


CREATE TABLE CONSTRUCTORS(
constructor_id varchar(5) NOT NULL UNIQUE,
constructor_name varchar(255) NOT NULL,
colours varchar(255),
country varchar(20),
team_principal varchar(255),
entry_year int,
PRIMARY KEY (constructor_id)
);

CREATE TABLE DRIVERS(
constructor_id varchar(5) NOT NULL,
driver_id varchar(3) NOT NULL UNIQUE,
driver_name varchar(255) NOT NULL,
car_no int,
world_championships int DEFAULT 0,
birth_date date NOT NULL,
country varchar(20),
PRIMARY KEY (driver_id),
FOREIGN KEY (constructor_id) REFERENCES CONSTRUCTORS(constructor_id)
);

CREATE TABLE TRACKS(
track_id varchar(5) NOT NULL UNIQUE,
track_name varchar(255) NOT NULL,
track_length int NOT NULL,
country varchar(20) NOT NULL,
PRIMARY KEY (track_id)
);

CREATE TABLE RACES(
race_id varchar(6) NOT NULL UNIQUE,
race_name varchar(255) NOT NULL,
track_id varchar(5) NOT NULL,
numberof_laps int NOT NULL,
race_date varchar(20) NOT NULL UNIQUE,
PRIMARY KEY (race_id),
FOREIGN KEY (track_id) REFERENCES TRACKS(track_id)
);

CREATE TABLE WINNERS(
race_id varchar(6) NOT NULL,
driver_id varchar(3) NOT NULL,
constructor_id varchar(5) NOT NULL,
starting_position int,
finish_position int,
points int,
PRIMARY KEY (race_id, driver_id),
FOREIGN KEY (race_id) REFERENCES RACES(race_id),
FOREIGN KEY (driver_id) REFERENCES DRIVERS(driver_id),
FOREIGN KEY (constructor_id) REFERENCES CONSTRUCTORS(constructor_id)
);


INSERT INTO CONSTRUCTORS (constructor_id, constructor_name, colours, country, team_principal, entry_year)
VALUES
('FER', 'Ferrari', 'Red', 'Italy', 'Mattia Binotto', 1950),
('MERC', 'Mercedes', 'Silver-Black', 'Germany', 'Toto Wolff', 1970),
('RDBLL', 'Red Bull', 'Dark Blue', 'Austria', 'Christian Horner', 1997),
('MCL', 'McLaren', 'Orange', 'UK', 'Andreas Seidl', 1966),
('REN', 'Renault', 'Yellow-Black', 'France', 'Cyril Abiteboul', 1986),
('RP', 'Racing Point', 'Pink', 'UK', 'Otmar Szafnauer', 2018),
('AT', 'Alpha Tauri', 'Dark Blue-White', 'Italy', 'Franz Tost', 1985),
('AR', 'Alfa Romeo', 'Red-White', 'Switzerland', 'Frederic Vasseur', 1993),
('HAAS', 'Haas', 'Red-Black', 'USA', 'Guenther Steiner', 2016),
('WILL', 'Williams', 'Blue-White', 'UK', 'Simon Roberts', 1978);

INSERT INTO DRIVERS (constructor_id, driver_id, driver_name, car_no, world_championships, birth_date, country)
VALUES
('FER', 'VET', 'Sebastian Vettel', 5, 4, '1987-07-03', 'Germany'),
('FER', 'LEC', 'Charles Leclerc', 16, 0, '1997-10-16', 'Monaco'),
('MERC', 'HAM', 'Lewis Hamilton', 44, 7, '1985-01-07', 'UK'),
('MERC', 'BOT', 'Valtteri Bottas', 77, 0, '1989-08-28', 'Finland'),
('RDBLL', 'VER', 'Max Verstappen', 33, 0, '1997-09-30', 'Netherlands'),
('RDBLL', 'ALB', 'Alexander Albon', 23, 0, '1996-03-23', 'Thailand'),
('MCL', 'SAI', 'Carlos Sainz', 55, 0, '1994-09-01', 'Spain'),
('MCL', 'NOR', 'Lando Norris', 4, 0, '1999-11-13', 'UK'),
('REN', 'RIC', 'Daniel Ricciardo', 3, 0, '1989-07-01', 'Australia'),
('REN', 'OCO', 'Esteban Ocon', 31, 0, '1996-09-17', 'France'),
('RP', 'PER', 'Sergio Perez', 11, 0, '1990-01-26', 'Mexico'),
('RP', 'STR', 'Lance Stroll', 18, 0, '1998-10-29', 'Canada'),
('RP', 'HUL', 'Nico Hulkenberg', 27, 0, '1987-08-19', 'Germany'),
('AT', 'GAS', 'Pierre Gasly', 10, 0, '1996-02-07', 'France'),
('AT', 'KVY', 'Daniil Kvyat', 26, 0, '1994-04-27', 'Russia'),
('AR', 'RAI', 'Kimi Raikkonen', 7, 1, '1979-10-17', 'Finland'),
('AR', 'GIO', 'Antonio Giovinazzi', 99, 0, '1993-12-14', 'Italy'),
('HAAS', 'GRO', 'Romain Grosjean', 8, 0, '1986-04-17', 'France'),
('HAAS', 'MAG', 'Kevin Magnussen', 20, 0, '1992-10-05', 'Denmark'),
('HAAS', 'FIT', 'Pietro Fittipaldi', 51, 0, '1996-06-25', 'Brazil'),
('WILL', 'RUS', 'George Russel', 63, 0, '1998-02-15', 'UK'),
('WILL', 'LAT', 'Nicholas Latifi', 6, 0, '1995-06-29', 'Canada'),
('WILL', 'AIT', 'Jack Aitken', 89, 0, '1995-09-23', 'UK');

INSERT INTO TRACKS (track_id, track_name, track_length, country)
VALUES
('RBR', 'Red Bull Ring', 4318, 'Austria'),
('HGR', 'Hungaroring', 4381, 'Hungary'),
('SVS', 'Silverstone Circuit', 5891, 'UK'),
('CBC', 'Circuit de Barcelona-Catalunya', 4655, 'Spain'),
('CSF', 'Circuit de Spa-Francorchamps', 7004, 'Belgium'),
('AND', 'Autodromo Nazionale di Monza', 5793, 'Italy'),
('MUG', 'Mugello Circuit', 5245, 'Italy'),
('SOC', 'Sochi Autodrom', 5848, 'Russia'),
('NUR', 'Nurburgring', 5148, 'Germany'),
('AIC', 'Algarve International Circuit', 4653, 'Portugal'),
('IMO', 'Imola Ciruit', 4909, 'Italy'),
('IST', 'Istanbul Park', 5338, 'Turkey'),
('BIC', 'Bahrain International Circuit', 5412, 'Bahrain'),
('BIC2', 'Bahrain International Circuit', 3543, 'Bahrain'),
('YMC', 'Yas Marina Circuit', 5554, 'UAE');

INSERT INTO RACES (race_id, race_name, track_id, numberof_laps, race_date)
VALUES
('AGP', 'Austrian Grand Prix', 'RBR', 71, '9 July'),
('SGP', 'Styrian Grand Prix', 'RBR', 71, '12 July'),
('HGP', 'Hungarian Grand Prix', 'HGR', 70, '19 July'),
('BGP', 'British Grand Prix', 'SVS', 52, '2 August'),
('70GP', '70th Anniversary Grand Prix', 'SVS', 52, '9 August'),
('SPGP', 'Spanish Grand Prix', 'CBC', 66, '16 August'),
('BLGP', 'Belgian Grand Prix', 'CSF', 44, '30 August'),
('IGP', 'Italian Grand Prix', 'AND', 53, '6 September'),
('TGP', 'Tuscan Grand Prix', 'MUG', 59, '13 September'),
('RGP', 'Russian Grand Prix', 'SOC', 53, '27 September'),
('EGP', 'Eifel Grand Prix', 'NUR', 60, '11 October'),
('PGP', 'Portuguese Grand Prix', 'AIC', 66, '25 October'),
('ERGP', 'Emilia Romagna Grand Prix', 'IMO', 63, '1 November'),
('TRGP', 'Turkish Grand Prix', 'IST', 58, '15 November'),
('BHGP', 'Bahrain Grand Prix', 'BIC', 57, '29 November'),
('SKGP', 'Sakhir Grand Prix', 'BIC2', 87, '6 December'),
('ADGP', 'Abu Dhabi Grand Prix', 'YMC', 55, '13 December');

INSERT INTO WINNERS (race_id, driver_id, constructor_id, starting_position, finish_position, points)
VALUES
('AGP', 'BOT', 'MERC', 1, 1, 25),
('AGP', 'LEC', 'FER', 7, 2, 18),
('AGP', 'NOR', 'MCL', 3, 3, 16),
('SGP', 'HAM', 'MERC', 1, 1, 25),
('SGP', 'BOT', 'MERC', 4, 2, 18),
('SGP', 'VER', 'RDBLL', 2, 3, 15),
('HGP', 'HAM', 'MERC', 1, 1, 26),
('HGP', 'VER', 'RDBLL', 7, 2, 18),
('HGP', 'BOT', 'MERC', 3, 3, 15),
('BGP', 'HAM', 'MERC', 1, 1, 25),
('BGP', 'VER', 'RDBLL', 3, 2, 19),
('BGP', 'LEC', 'FER', 4, 3, 15),
('70GP', 'VER', 'RDBLL', 4, 1 ,25),
('70GP', 'HAM', 'MERC', 2, 2, 19),
('70GP', 'BOT', 'MERC', 1, 3, 15),
('SPGP', 'HAM', 'MERC', 1, 1, 25),
('SPGP', 'VER', 'RDBLL', 3, 2, 18),
('SPGP', 'BOT', 'MERC', 2, 3, 16),
('BLGP', 'HAM', 'MERC', 1, 1, 25),
('BLGP', 'BOT', 'MERC', 2, 2, 18),
('BLGP', 'VER', 'RDBLL', 3, 3, 15),
('IGP', 'GAS', 'AT', 10, 1, 25),
('IGP', 'SAI', 'MCL', 2, 2, 18),
('IGP', 'STR', 'RP', 8, 3, 15),
('TGP', 'HAM', 'MERC', 1, 1, 26),
('TGP', 'BOT', 'MERC', 2, 2, 18),
('TGP', 'ALB', 'RDBLL', 4, 3, 15),
('RGP', 'BOT', 'MERC', 3, 1, 26),
('RGP', 'VER', 'RDBLL', 2, 2, 18),
('RGP', 'HAM', 'MERC', 1, 3, 15),
('EGP', 'HAM', 'MERC', 2, 1, 25),
('EGP', 'VER', 'RDBLL', 3, 2, 19),
('EGP', 'RIC', 'REN', 6, 3, 15),
('PGP', 'HAM', 'MERC', 1, 1, 25),
('PGP', 'BOT', 'MERC', 2, 2, 18),
('PGP', 'VER', 'RDBLL', 3, 3, 15),
('ERGP', 'HAM', 'MERC', 2, 1, 26),
('ERGP', 'BOT', 'MERC', 1, 2, 18),
('ERGP', 'RIC', 'REN', 5, 3, 15),
('TRGP', 'HAM', 'MERC', 6, 1, 25),
('TRGP', 'PER', 'RP', 3, 2, 18),
('TRGP', 'VET', 'FER', 11, 3, 15),
('BHGP', 'HAM', 'MERC', 1, 1, 25),
('BHGP', 'VER', 'RDBLL', 3, 2, 19),
('BHGP', 'ALB', 'RDBLL', 4, 3, 15),
('SKGP', 'PER', 'RP', 5, 1, 25),
('SKGP', 'OCO', 'REN', 11, 2, 18),
('SKGP', 'STR', 'RP', 10, 3, 15),
('ADGP', 'VER', 'RDBLL', 1, 1, 25),
('ADGP', 'BOT', 'MERC', 2, 2, 18),
('ADGP', 'HAM', 'MERC', 3, 3, 15);

SELECT constructor_name, entry_year FROM CONSTRUCTORS
ORDER BY entry_year;

SELECT driver_name, world_championships FROM DRIVERS
WHERE world_championships > 0
ORDER BY world_championships DESC;

SELECT driver_name AS MostChampionshipWinner, world_championships FROM DRIVERS 
WHERE world_championships = (SELECT MAX(world_championships) FROM DRIVERS) ;

SELECT driver_name, birth_date FROM DRIVERS
ORDER BY birth_date;

SELECT country AS DriversCountries FROM DRIVERS
GROUP BY country;

SELECT DISTINCT country AS CountriesTracksLocated FROM TRACKS;

SELECT track_name AS ShortestTrack, track_length FROM TRACKS
WHERE track_length = (SELECT MIN(track_length) FROM TRACKS);

SELECT track_name AS LongestTrack, track_length FROM TRACKS
WHERE track_length = (SELECT MAX(track_length) FROM TRACKS);

SELECT AVG(track_length) AS AvgTrackLength FROM TRACKS;

SELECT RACES.race_id, RACES.race_name, TRACKS.track_name, RACES.numberof_laps, TRACKS.track_length FROM RACES
INNER JOIN TRACKS ON RACES.track_id=TRACKS.track_id;

SELECT SUM(numberof_laps) AS TotalLapsForYear FROM RACES;

SELECT DISTINCT driver_id, constructor_id FROM WINNERS;

SELECT race_id, driver_id, constructor_id FROM WINNERS
WHERE finish_position = 1
ORDER BY race_id;

SELECT driver_id, race_id FROM WINNERS
WHERE driver_id = 'HAM' AND finish_position = 1
ORDER BY race_id;

SELECT constructor_id, driver_id, race_id FROM WINNERS
WHERE constructor_id = 'MERC' AND finish_position = 1
ORDER BY race_id;

SELECT SUM(finish_position) AS TimesHamiltonWon FROM WINNERS
WHERE driver_id = 'HAM' AND finish_position = 1;

SELECT driver_id AS HighestRise, (starting_position-finish_position) AS PlacesGained FROM WINNERS
WHERE (starting_position-finish_position) = (SELECT MAX(starting_position-finish_position) FROM WINNERS);