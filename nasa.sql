-- 
--
-- This database describes the United States space program, prior to the
-- space shuttle.  
--
-- If you are concerned that NASA history is not relevant
-- to a Business-oriented student, you are wrong: Forom a business perspective
-- these are just projects, and the astronauts are "just" workers assigned to
-- one or more tasks (ie. missions).
--
-- Prior to the shuttle, NASA ran five different "manned" space projects:
-- 
-- Project Mercury (1961-63): The six missions of this project carried a
-- single astronaut, the 'pilot'. The first two missions were sub-orbital
-- (missionType = 'SO') and four missions that took the astronauts into
-- Earth orbit (missionType = 'EO').
-- 
-- Project Gemini (1965-66):  Each of the 10 manned missions of this
-- program carried two astronauts, the 'Commander' and 'Pilot', into Earth
-- orbit (missionType = 'EO'). (The first manned mission was number 3, the
-- first two were unmanned tests.)
-- 
-- Project Apollo (1967-1972): Each of these missions carried three
-- astronauts, the 'Commander', 'Command Module Pilot', and 'Lunar Module
-- Pilot.  Most missions used two spacecraft, the 'Command Service Module'
-- (craftType='CSM') and the 'Lunar Module' (craftType='LM').  In most
-- missions (missionType = 'LL'), the Command Module Pilot would stay in
-- lunar orbit in the CSM, while the Commander and Lunar Module Pilot
-- descended in the LM.  Apollo 11 was the first mission to land on the
-- moon.  Earlier missions were test flights.  Apollo 1 did not fly
-- (hence the missionType of this mission has been left null). The crew of
-- Apollo 1 was killed while testing the spacecraft on the launch pad.
-- The first manned Apollo mission was Apollo 7.  It tested a CSM in earth
-- orbit (missionType = 'EO') and did not have a lunar module.  Apollo 8
-- tested a CSM in lunar orbit (missionType = 'LO') and also did not have
-- a lunar module.  Apollo 9 tested a LM in Earth orbit, and Apollo 10
-- tested a LM in lunar orbit.  From Apollo 11 onward, all missions landed
-- on the moon (missionType = 'LL'), with one exception, Apollo 13, which
-- aborted its mission on the way to the moon, and looped round the moon
-- without entering orbit (a "Fly By", missionType='LF').
-- 
-- Project Skylab (1973):  Skylab 1 was the launch of the first US space
-- station, in Earth orbit.   Each of Skylab missions 2 to 4 took a
-- three-man crew to the Skylab station in an Apollo CSM. The third member
-- of each crew was called the scientist (not Lunar Module Pilot).
-- 
-- Project Apollo-Soyuz (1975): A three-man crew in an Apollo CSM docked
-- with a Russian Soyuz spacecraft in Earth orbit.  The third member of
-- that crew was called the Docking Module Pilot (not Lunar Module Pilot).

DROP table NASA_Assigned;
DROP table NASA_SpaceCraft;
DROP table NASA_Mission;
DROP table NASA_Astronaut;
DROP table NASA_Projects;

Create table NASA_Projects
(
	project		char(15),
	
	CONSTRAINT NASA_ProjectsPK PRIMARY KEY (project)
);

Create table NASA_Astronaut
(
	astroNo		integer,
	astroName	char(25),
	birth		integer,
	death		integer,

	CONSTRAINT NASA_AstronautPK PRIMARY KEY (astroNo)
);

Create table NASA_Mission
(
	projectName 	char(15),
	missionNo	integer,
	missionType 	char(2),
	launchYear	integer,
	launchMonth	integer,
	launchDay	integer,
	days		integer,
	hours		integer,
     	minutes		integer,
	description	char(80),

   CONSTRAINT NASA_MissionPK PRIMARY KEY (projectName, missionNo),
   CONSTRAINT NASA_MissionFK FOREIGN KEY (projectName) REFERENCES NASA_Projects
);


Create table NASA_Assigned
(
	projectName	char(15),
	missionNo  	integer,
	astroNo	  	integer,
	role		char(25),

   CONSTRAINT NASA_AssignedPK PRIMARY KEY (projectName, missionNo, astroNo),

   CONSTRAINT NASA_AssignedFK_Mission FOREIGN KEY
			(projectName, missionNo) REFERENCES NASA_Mission,

   CONSTRAINT NASA_AssignedFK_Astronaut FOREIGN KEY
			(astroNo) REFERENCES NASA_Astronaut

);

Create table NASA_SpaceCraft
(
	projectName	char(15),
	missionNo	integer,
	craftType	char(10),
	craftName	char(20),

  CONSTRAINT NASA_SpaceCraftPK PRIMARY KEY (projectName, missionNo, craftType),

  CONSTRAINT NASA_SpaceCraftFK FOREIGN KEY
			(projectName, missionNo) REFERENCES NASA_Mission
);

INSERT INTO NASA_Projects VALUES('Mercury');
INSERT INTO NASA_Projects VALUES('Gemini');
INSERT INTO NASA_Projects VALUES('Apollo');
INSERT INTO NASA_Projects VALUES('Skylab');
INSERT INTO NASA_Projects VALUES('Apollo-Soyuz');



Insert into NASA_Astronaut VALUES( 1,'Aldrin, Buzz',1930,NULL);
Insert into NASA_Astronaut VALUES( 2,'Anders, William',1933,NULL);
Insert into NASA_Astronaut VALUES( 3,'Armstrong, Neil',1930,NULL);
Insert into NASA_Astronaut VALUES( 4,'Bean, Alan',1932,NULL);
Insert into NASA_Astronaut VALUES( 5,'Borman, Frank',1928,NULL);
Insert into NASA_Astronaut VALUES( 6,'Brand, Vance',1931,NULL);
Insert into NASA_Astronaut VALUES( 7,'Carpenter, Scott',1925,NULL);
Insert into NASA_Astronaut VALUES( 8,'Carr, Gerald',1932,NULL);
Insert into NASA_Astronaut VALUES( 9,'Cernan, Gene',1934,NULL);
Insert into NASA_Astronaut VALUES(10,'Chaffee, Roger',1935,1967);
Insert into NASA_Astronaut VALUES(11,'Collins, Michael',1930,NULL);
Insert into NASA_Astronaut VALUES(12,'Conrad, Charles',1930,1999);
Insert into NASA_Astronaut VALUES(13,'Cooper, Gordo',1927,2004);
Insert into NASA_Astronaut VALUES(14,'Cunningham, Walter',1932,NULL);
Insert into NASA_Astronaut VALUES(15,'Duke, Charles',1935,NULL);
Insert into NASA_Astronaut VALUES(16,'Eisele, Donn',1930,1987);
Insert into NASA_Astronaut VALUES(17,'Evans, Ron',1933,1990);
Insert into NASA_Astronaut VALUES(18,'Garriott, Owen',1930,NULL);
Insert into NASA_Astronaut VALUES(19,'Gibson, Edward',1936,NULL);
Insert into NASA_Astronaut VALUES(20,'Glenn, John',1921,NULL);
Insert into NASA_Astronaut VALUES(21,'Gordon, Richard',1929,NULL);
Insert into NASA_Astronaut VALUES(22,'Grissom, Gus',1926,1967);
Insert into NASA_Astronaut VALUES(23,'Haise, Fred',1933,NULL);
Insert into NASA_Astronaut VALUES(24,'Irwin, James',1930,1991);
Insert into NASA_Astronaut VALUES(25,'Kerwin, Joseph',1932,NULL);
Insert into NASA_Astronaut VALUES(26,'Lousma, Jack',1936,NULL);
Insert into NASA_Astronaut VALUES(27,'Lovell, James',1928,NULL);
Insert into NASA_Astronaut VALUES(28,'Mattingly, Thomas',1936,NULL);
Insert into NASA_Astronaut VALUES(29,'McDivitt, James',1929,NULL);
Insert into NASA_Astronaut VALUES(30,'Mitchell, Edgar',1930,NULL);
Insert into NASA_Astronaut VALUES(31,'Pogue, William',1930,NULL);
Insert into NASA_Astronaut VALUES(32,'Roosa, Stu',1933,1994);
Insert into NASA_Astronaut VALUES(33,'Schirra, Wally',1923,NULL);
Insert into NASA_Astronaut VALUES(34,'Schmitt, Harrison',1935,NULL);
Insert into NASA_Astronaut VALUES(35,'Schweickart, Rusty',1935,NULL);
Insert into NASA_Astronaut VALUES(36,'Scott, David',1932,NULL);
Insert into NASA_Astronaut VALUES(37,'Shepard, Alan',1923,1998);
Insert into NASA_Astronaut VALUES(38,'Slayton, Deke',1924,1993);
Insert into NASA_Astronaut VALUES(39,'Stafford, Thomas',1930,NULL);
Insert into NASA_Astronaut VALUES(40,'Swigert, John',1931,1982);
Insert into NASA_Astronaut VALUES(41,'Weitz, Paul',1932,NULL);
Insert into NASA_Astronaut VALUES(42,'White, Edward',1930,1967);
Insert into NASA_Astronaut VALUES(43,'Worden, Alfred',1932,NULL);
Insert into NASA_Astronaut VALUES(44,'Young, John',1930,NULL);


Insert into NASA_Mission Values('Mercury',  1, 'SO', 1961,  5,  5,  0,  0, 15, 'First American into space');
Insert into NASA_Mission Values('Mercury',  2, 'SO', 1961,  7, 21,  0,  0, 15, 'Capsule sank after splashdown');
Insert into NASA_Mission Values('Mercury',  3, 'EO', 1962,  2, 20,  0,  4, 55, 'First American into orbit');
Insert into NASA_Mission Values('Mercury',  4, 'EO', 1962,  5, 24,  0,  4, 56, 'Cronkite: We may have lost an astronaut');
Insert into NASA_Mission Values('Mercury',  5, 'EO', 1962, 10,  3,  0,  9, 13,NULL);
Insert into NASA_Mission Values('Mercury',  6, 'EO', 1963,  5, 15,  1, 10, 20,NULL);
Insert into NASA_Mission Values('Gemini',  3, 'EO', 1965,  3, 23,  0,  4, 53, 'First Ham Sandwich in Space');
Insert into NASA_Mission Values('Gemini',  4, 'EO', 1965,  6,  3,  4,  1, 56, 'First American Spacewalk');
Insert into NASA_Mission Values('Gemini',  5, 'EO', 1965,  8, 21,  7, 22, 55, 'Eight Days or Bust');
Insert into NASA_Mission Values('Gemini',  6, 'EO', 1965, 12, 15,  1,  1, 52, 'First Rendevous');
Insert into NASA_Mission Values('Gemini',  7, 'EO', 1965, 12,  4, 13, 18, 35, 'Longest Flight not on a Space Station');
Insert into NASA_Mission Values('Gemini',  8, 'EO', 1966,  3, 16,  0, 10, 41, 'First docking; first space emergency');
Insert into NASA_Mission Values('Gemini',  9, 'EO', 1966,  6,  3,  3,  0, 20, 'The Angry Alligator; aborted spacewalk');
Insert into NASA_Mission Values('Gemini', 10, 'EO', 1966,  7, 18,  2, 22, 47,NULL);
Insert into NASA_Mission Values('Gemini', 11, 'EO', 1966,  9, 12,  2, 23, 17,NULL);
Insert into NASA_Mission Values('Gemini', 12, 'EO', 1966, 11, 11,  3, 22, 34, 'First unequivocally successful EVA');
Insert into NASA_Mission Values('Apollo',  1, NULL, 1967,  1, 27,  0,  0,  0, 'Crew killed in launch test');
Insert into NASA_Mission Values('Apollo',  7, 'EO', 1968, 10, 11, 10, 20,  9, 'First successful Apollo mission');
Insert into NASA_Mission Values('Apollo',  8, 'LO', 1968, 12, 21,  6,  3,  0, 'THAT photo of Earth from Moon; Genesis');
Insert into NASA_Mission Values('Apollo',  9, 'EO', 1969,  3,  3, 10,  1,  0,'First test of Lunar Module');
Insert into NASA_Mission Values('Apollo', 10, 'LO', 1969,  5, 18,  8,  0,  3,NULL);
Insert into NASA_Mission Values('Apollo', 11, 'LL', 1969,  7, 16,  8,  3, 19, 'One Small Step for [a] man, one giant leap for mankind');
Insert into NASA_Mission Values('Apollo', 12, 'LL', 1969, 11, 14, 10,  4, 36, 'It might have been a small step for Neil, but it was a big one for me');
Insert into NASA_Mission Values('Apollo', 13, 'LF', 1970,  4, 11,  5, 22, 54, 'Houston, we have a problem');
Insert into NASA_Mission Values('Apollo', 14, 'LL', 1971,  1, 31,  9,  0,  0,NULL);
Insert into NASA_Mission Values('Apollo', 15, 'LL', 1971,  7, 26, 12,  7, 12, 'Man must explore; First use of lunar rover');

Insert into NASA_Mission Values('Apollo', 16, 'LL', 1972,  4, 16, 11,  1, 51,NULL);
Insert into NASA_Mission Values('Apollo', 17, 'LL', 1972, 12,  7, 12, 13, 51,NULL);
Insert into NASA_Mission Values('Skylab', 2, 'EO', 1973,  5, 25, 28,  0, 50, 'Skylab rescue mission');
Insert into NASA_Mission Values('Skylab',  3, 'EO', 1973,  7, 28, 59, 11,  9,NULL);
Insert into NASA_Mission Values('Skylab',  4, 'EO', 1973, 11, 16, 84,  1, 15,NULL);
Insert into NASA_Mission Values('Apollo-Soyuz', 1, 'EO', 1975, 7, 15, 9, 1, 28,NULL);


Insert into NASA_SpaceCraft Values('Mercury',  1, 'capsule', 'Freedom 7');
Insert into NASA_SpaceCraft Values('Mercury',  2, 'capsule', 'Liberty Bell 7');
Insert into NASA_SpaceCraft Values('Mercury',  3, 'capsule', 'Friendship 7');
Insert into NASA_SpaceCraft Values('Mercury',  4, 'capsule', 'Aurora 7');
Insert into NASA_SpaceCraft Values('Mercury',  5, 'capsule', 'Sigma 7');
Insert into NASA_SpaceCraft Values('Mercury',  6, 'capsule', 'Faith 7');
Insert into NASA_SpaceCraft Values('Gemini',   3, 'capsule', 'Molly Brown');
Insert into NASA_SpaceCraft Values('Apollo',   9, 'CSM',     'Gum Drop');
Insert into NASA_SpaceCraft Values('Apollo',   9, 'LM',      'Spider');
Insert into NASA_SpaceCraft Values('Apollo',  10, 'CSM',     'Charlie Brown');
Insert into NASA_SpaceCraft Values('Apollo',  10, 'LM',      'Snoopy');
Insert into NASA_SpaceCraft Values('Apollo',  11, 'CSM',     'Columbia');
Insert into NASA_SpaceCraft Values('Apollo',  11, 'LM',      'Eagle');
Insert into NASA_SpaceCraft Values('Apollo',  12, 'CSM',     'Yankee Clipper');
Insert into NASA_SpaceCraft Values('Apollo',  12, 'LM',      'Intrepid');
Insert into NASA_SpaceCraft Values('Apollo',  13, 'CSM',     'Odyssey');
Insert into NASA_SpaceCraft Values('Apollo',  13, 'LM',      'Aquarius');
Insert into NASA_SpaceCraft Values('Apollo',  14, 'CSM',     'Kitty Hawk');
Insert into NASA_SpaceCraft Values('Apollo',  14, 'LM',      'Antares');
Insert into NASA_SpaceCraft Values('Apollo',  15, 'CSM',     'Endeavour');
Insert into NASA_SpaceCraft Values('Apollo',  15, 'LM',      'Falcon');
Insert into NASA_SpaceCraft Values('Apollo',  16, 'CSM',     'Casper');
Insert into NASA_SpaceCraft Values('Apollo',  16, 'LM',      'Orion');
Insert into NASA_SpaceCraft Values('Apollo',  17, 'CSM',     'America');
Insert into NASA_SpaceCraft Values('Apollo',  17, 'LM',      'Challenger');


Insert into NASA_Assigned Values('Mercury',  1, 37, 'Pilot');
Insert into NASA_Assigned Values('Mercury',  2, 22, 'Pilot');
Insert into NASA_Assigned Values('Mercury',  3, 20, 'Pilot');
Insert into NASA_Assigned Values('Mercury',  4,  7, 'Pilot');
Insert into NASA_Assigned Values('Mercury',  5, 33, 'Pilot');
Insert into NASA_Assigned Values('Mercury',  6, 13, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  3, 22, 'Commander');
Insert into NASA_Assigned Values('Gemini',  3, 44, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  4, 29, 'Commander');
Insert into NASA_Assigned Values('Gemini',  4, 42, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  5, 13, 'Commander');
Insert into NASA_Assigned Values('Gemini',  5, 12, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  6,  5, 'Commander');
Insert into NASA_Assigned Values('Gemini',  6, 27, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  7, 33, 'Commander');
Insert into NASA_Assigned Values('Gemini',  7, 39, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  8,  3, 'Commander');
Insert into NASA_Assigned Values('Gemini',  8, 36, 'Pilot');
Insert into NASA_Assigned Values('Gemini',  9, 39, 'Commander');
Insert into NASA_Assigned Values('Gemini',  9,  9, 'Pilot');
Insert into NASA_Assigned Values('Gemini', 10, 44, 'Commander');
Insert into NASA_Assigned Values('Gemini', 10, 11, 'Pilot');
Insert into NASA_Assigned Values('Gemini', 11, 12, 'Commander');
Insert into NASA_Assigned Values('Gemini', 11, 21, 'Pilot');
Insert into NASA_Assigned Values('Gemini', 12, 27, 'Commander');
Insert into NASA_Assigned Values('Gemini', 12,  1, 'Pilot');
Insert into NASA_Assigned Values('Apollo',  1, 22, 'Commander');
Insert into NASA_Assigned Values('Apollo',  1, 42, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo',  1, 10, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo',  7, 33, 'Commander');
Insert into NASA_Assigned Values('Apollo',  7, 16, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo',  7, 14, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo',  8,  5, 'Commander');
Insert into NASA_Assigned Values('Apollo',  8, 27, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo',  8,  2, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo',  9, 29, 'Commander');
Insert into NASA_Assigned Values('Apollo',  9, 36, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo',  9, 35, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 10, 39, 'Commander');
Insert into NASA_Assigned Values('Apollo', 10, 44, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 10,  9, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 11,  3, 'Commander');
Insert into NASA_Assigned Values('Apollo', 11, 11, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 11,  1, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 12, 12, 'Commander');
Insert into NASA_Assigned Values('Apollo', 12, 21, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 12,  4, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 13, 27, 'Commander');
Insert into NASA_Assigned Values('Apollo', 13, 40, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 13, 23, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 14, 37, 'Commander');
Insert into NASA_Assigned Values('Apollo', 14, 32, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 14, 30, 'Lunar Module Pilot');

Insert into NASA_Assigned Values('Apollo', 15, 43, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 15, 24, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 16, 44, 'Commander');
Insert into NASA_Assigned Values('Apollo', 16, 28, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 16, 15, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Apollo', 17,  9, 'Commander');
Insert into NASA_Assigned Values('Apollo', 17, 17, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo', 17, 34, 'Lunar Module Pilot');
Insert into NASA_Assigned Values('Skylab',  2, 12, 'Commander');
Insert into NASA_Assigned Values('Skylab',  2, 41, 'Pilot');
Insert into NASA_Assigned Values('Skylab',  2, 25, 'Scientist');
Insert into NASA_Assigned Values('Skylab',  3,  4, 'Commander');
Insert into NASA_Assigned Values('Skylab',  3, 26, 'Pilot');
Insert into NASA_Assigned Values('Skylab',  3, 18, 'Scientist');
Insert into NASA_Assigned Values('Skylab',  4,  8, 'Commander');
Insert into NASA_Assigned Values('Skylab',  4, 31, 'Pilot');
Insert into NASA_Assigned Values('Skylab',  4, 19, 'Scientist');
Insert into NASA_Assigned Values('Apollo-Soyuz', 1, 39, 'Commander');
Insert into NASA_Assigned Values('Apollo-Soyuz', 1,  6, 'Command Module Pilot');
Insert into NASA_Assigned Values('Apollo-Soyuz', 1, 38, 'Docking Module Pilot');
