drop table if exists fifa_details;
create table fifa_details (
	ID      	integer,
	Name      	varchar,
	age      	integer,
	photo      	varchar,
	nationality varchar,
	flag_s     	varchar,
	overall      	integer,
	potential      	integer,
	Club      	varchar,
	Club_logo      	varchar,
	value_s      	varchar,
	Wage      	varchar,
	special      	varchar,
	Preferred_foot      	varchar,
	International_reputation      	integer,
	Weak_foot      	varchar,
	Skill_Moves     varchar,
	Work_rate       varchar,
	Body_type      	varchar,
	Real_face      	varchar,
	Positions        varchar,
	Jersey_Number   integer,
	Joined          date,
	loaned_from          varchar,
	contract_valid_until varchar,
	height          varchar,
	weight          varchar,
	LS				varchar,
	ST				varchar,
	RS				varchar,
	LW				varchar,
	LF				varchar,
	CF				varchar,
	RF				varchar, 
	RW				varchar, 
	LAM				varchar,
	CAM				varchar,
	RAM				varchar,
	LM				varchar,
	LCM				varchar,
	CM				varchar,
	RCM				varchar,
	RM				varchar,
	LWB				varchar,
	LDM				varchar,
	CDM				varchar,
	RDM				varchar,
	RWB				varchar,
	LB				varchar,
	LCB				varchar,
	CB				varchar,
	RCB				varchar,
	RB				varchar,
	Crossing		integer,
	Finishing		integer,
	Heading			integer,
	ShortPassing	integer,
	Volleys		    integer, 
	Dribbling		integer,
	Curve			integer,
	FKAccuracy		integer,
	LongPassing		integer,
	BallControl		integer,
	Acceleration	varchar,
	SprintSpeed		integer,
	Agility			integer,
	Reactions		varchar,
	Balance			varchar,
	ShotPower		varchar,
	Jumping			integer,
	Stamina			integer,
	Strength		integer,
	LongShots		integer,
	Aggression		varchar,
	Interceptions	varchar,
	Positioning		integer,
	Vision			integer,
	Penalties		varchar,
	Composure 		varchar,
	Marking 		varchar,
	StandingTackle 	integer,
	SlidingTackle 	integer,
	GKDiving 		integer,
	GKHandling 		integer,
	GKKicking 		integer,
	GKPositioning 	integer,
	GKReflexes 		integer,
	ReleaseClause 	varchar
);

drop table if exists Positions;
CREATE TABLE IF NOT EXISTS Positions
(
pos_id serial NOT NULL,
position_name varchar,
CONSTRAINT pos_id PRIMARY KEY (pos_id)
);

drop table if exists Player;
CREATE TABLE IF NOT EXISTS Player
(
id integer,    
Player_ID serial NOT NULL,
Name varchar,
Age integer,
Nationality varchar,
Wages varchar,
Market_value varchar,
Jersey_number integer,
Club varchar,
Joined_date date,
Contract_valid_until integer,
position_id integer,
CONSTRAINT Player_ID PRIMARY KEY (Player_ID),
CONSTRAINT position_id FOREIGN KEY (position_id)
REFERENCES Positions (pos_id)
);

drop table if exists Player_bio;
CREATE TABLE IF NOT EXISTS Player_bio
(
ID serial NOT NULL,
Player_ID integer,
Name varchar,
Body_type varchar,
Height varchar,
Weight varchar,
Stamina integer,
Strength integer,
Vision integer,
CONSTRAINT ID PRIMARY KEY (ID),
CONSTRAINT Player_ID FOREIGN KEY (Player_ID)
REFERENCES Player (Player_ID)
ON UPDATE SET NULL
ON DELETE SET NULL
);

drop table if exists Ratings;
CREATE TABLE IF NOT EXISTS Ratings
(
Ratings_id integer,
Player_ID integer,
Overall_rating integer,
Potential_rating integer,
International_rating integer,
CONSTRAINT Ratings_id PRIMARY KEY (Ratings_id),
CONSTRAINT Player_ID FOREIGN KEY (Player_ID)
REFERENCES Player (Player_ID)
ON UPDATE SET NULL
ON DELETE SET NULL
);

drop table if exists Skills;
CREATE TABLE IF NOT EXISTS Skills
(
Skills_ID serial NOT NULL,
Player_ID integer,
Jumping integer,
Agility integer,
Long_shots integer,
Crossing integer,
Finishing integer,
Heading integer,
Short_passing integer,
Long_passing integer,
Volleys integer,
Dribbling integer,
Curve integer,
FKAccuracy integer,
Ballcontrol integer,
Sprint_speed integer,
GK_diving integer,
Positioning integer,
GK_handling integer,
GK_reflexes integer,
GK_kicking integer,
Sliding_tackle integer,
Standing_tackle integer,
CONSTRAINT Skills_ID PRIMARY KEY (Skills_ID),
CONSTRAINT Player_ID FOREIGN KEY (Player_ID)
REFERENCES Player (Player_ID)
ON UPDATE SET NULL
ON DELETE SET NULL
);


CREATE SEQUENCE ratings_serial start 100;
CREATE SEQUENCE skill_serial start 100;

INSERT INTO positions(position_name) VALUES
('Left_striker'), ('Right_striker'), ('Striker'), ('Left_winger'), ('Left_forward'), ('Center_forward'), ('Right_forward'),
('Right_winger'), ('Center_attacking_midfielder'), ('Left_attacking_midfielder'), ('Right_attacking_midfielder'), 
('Right_back'), ('Left_back'), ('Center_back'), ('Left_defensive_midfielder'), ('Right_defensive_midfielder'),
('Center_defensive_midfielder'), ('Left_wing_back'), ('Right_wing_back'), ('Left_midfielder'), ('Right_midfielder'), ('Goal_Keeper'),
('Left Centre Midfielder'), ('Right Centre Midfielder'), ('Left Center Back'), ('Right Center Back'), ('Centre Midfield')
;

-- drop SEQUENCE ratings_serial;
-- drop SEQUENCE skill_serial;
