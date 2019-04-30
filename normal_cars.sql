-- One Make Code belongs to one Make Title and vice versa.
-- One Model Code belongs to one Model Title and vice versa.
-- One Car Model has one Make, one Model, and one year.

-- Setup
CREATE TABLE makes AS
  SELECT DISTINCT make_code, make_title
  FROM car_models;

CREATE TABLE models AS 
  SELECT DISTINCT model_code, model_title
  FROM car_models;

ALTER TABLE makes 
  ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE models 
  ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE car_models
  ADD COLUMN makes_id integer;

ALTER TABLE car_models
  ADD COLUMN models_id integer;

UPDATE car_models 
  SET makes_id = makes.id
  FROM makes
  WHERE car_models.make_code = makes.make_code;

ALTER TABLE car_models
  DROP COLUMN make_code;
  
ALTER TABLE car_models
  DROP COLUMN make_title;

ALTER TABLE car_models
  ADD CONSTRAINT foreign_key_make
  FOREIGN KEY (makes_id)
  REFERENCES makes (id);

UPDATE car_models
  SET models_id = models.id
  FROM models
  WHERE car_models.model_code = models.model_code;

ALTER TABLE car_models
  DROP COLUMN model_code;

ALTER TABLE car_models
  DROP COLUMN model_title;

ALTER TABLE car_models
  ADD CONSTRAINT foreign_key_model
  FOREIGN KEY (models_id) REFERENCES models (id);

ALTER TABLE car_models
  ADD COLUMN id serial PRIMARY KEY;

SELECT makes.make_title, 
FROM car_models.year
INNER JOIN makes.make_title ON car_models.makes_id = makes.id;

-- Step 8
SELECT car_models.makes_id, makes.make_title
  FROM car_models INNER JOIN makes ON car_models.makes_id = makes.id
  GROUP BY car_models.makes_id, makes.make_title;

-- Step 9
SELECT car_models.makes_id, car_models.models_id, makes.make_title
FROM car_models
INNER JOIN makes ON car_models.makes_id = makes.id
WHERE makes.make_code = 'VOLKS'
GROUP BY car_models.models_id, car_models.makes_id, makes.make_title;

-- Step 10  
SELECT car_models.year, makes.make_code, models.model_code, models.model_title
FROM car_models
INNER JOIN makes ON car_models.makes_id = makes.id 
INNER JOIN models ON car_models.models_id = models.id
WHERE makes.make_code = 'LAM';

-- Step 11
SELECT car_models.*, makes.make_code, makes.make_title, models.model_code, models.model_title
FROM car_models
INNER JOIN makes ON car_models.makes_id = makes.id
INNER JOIN models ON car_models.models_id = models.id
WHERE car_models.year >= 2010 AND car_models.year <= 2015;