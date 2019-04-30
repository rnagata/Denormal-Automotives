SELECT make_title FROM car_models
GROUP BY make_title;

SELECT model_title FROM car_models
WHERE make_code = 'VOLKS'
GROUP BY model_title;

SELECT make_code, model_code, model_title, year FROM car_models
WHERE make_code = 'LAM';

SELECT * FROM car_models
WHERE year >= 2010 AND year <= 2015;