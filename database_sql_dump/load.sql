UPDATE fifa_details 
SET contract_valid_until = CONCAT('20', RIGHT(contract_valid_until,2))::INTEGER
where contract_valid_until LIKE '%-%';

ALTER TABLE fifa_details
    ALTER COLUMN contract_valid_until TYPE integer USING contract_valid_until::integer;
	
ALTER TABLE player
    ALTER COLUMN contract_valid_until TYPE integer USING contract_valid_until::integer;

CREATE or replace FUNCTION PositionNumber (low integer, high integer)
RETURNS integer AS $$
BEGIN 
	RETURN floor(random()*(high-low+1) + low);
END;
$$ language 'plpgsql' STRICT;



INSERT INTO player (id, name, age, nationality, wages, market_value, jersey_number, club, joined_date, contract_valid_until, position_id)

  SELECT f.id, f.name, f.age, f.nationality, f.wage, f.value_s, f.jersey_number, f.club, f.joined, f.contract_valid_until, PositionNumber(1,27)
FROM fifa_details f;

INSERT INTO player_bio(
	player_id, name, body_type, height, weight, stamina, strength, vision)
 SELECT Distinct p.player_id, f.name, f.body_type, f.height, f.weight, f.stamina, 
		f.strength, f.vision
		FROM player p
		INNER JOIN fifa_details f
		ON p.id = f.id
;

INSERT INTO ratings(Ratings_id, player_id, overall_rating, potential_rating, international_rating)
	SELECT  nextval('ratings_serial'),p.player_id, f.overall, f.potential, f.international_reputation
		FROM player p
		INNER JOIN fifa_details f
		ON p.id = f.id
;



INSERT INTO skills(Skills_ID, Player_id, Jumping, Agility, Long_shots,Crossing, Finishing, Heading, Short_passing, Long_passing, Volleys, Dribbling, Curve, FKAccuracy,
		Ballcontrol, Sprint_speed, GK_diving, Positioning, GK_handling, GK_reflexes, GK_kicking, Sliding_tackle,
		Standing_tackle)
	SELECT nextval('skill_serial'), p.player_id, f. Jumping, f. Agility, f.LongShots, f.Crossing, f.Finishing, f.heading, f.shortpassing, f.longpassing, f.Volleys, f.Dribbling, f.Curve, f.FKAccuracy,
		f.Ballcontrol, f.sprintspeed, f.gkdiving, f.Positioning, f.gkhandling, f.gkreflexes, f.gkkicking, f.slidingtackle,
		f.standingtackle
		FROM player p
		INNER JOIN fifa_details f
		ON p.id = f.id
;


