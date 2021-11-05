SELECT * from animals WHERE animal_name like '%mon';
SELECT animal_name FROM animals WHERE date_of_birth BETWEEN '2016.01.01' AND '2019.12.31';
SELECT animal_name FROM animals WHERE neutered='1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE animal_name='Agumon' OR animal_name='Pikachu';
SELECT animal_name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered='1';
SELECT * FROM animals WHERE animal_name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';

ALTER TABLE animals
ADD species VARCHAR(250);

BEGIN;
UPDATE animals
SET species='unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species='digimon'
WHERE animal_name like '%mon';
UPDATE animals
SET species='pokemon'
WHERE species='';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022.01.01';
SAVEPOINT SAVEPOINT_1;
UPDATE animals
SET weight_kg= weight_kg * '-1';
ROLLBACK TO SAVEPOINT_1;
UPDATE animals
SET weight_kg= weight_kg * '-1'
WHERE weight_kg < 0;
COMMIT;

SELECT FROM animals;
SELECT FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE neutered='1';
SELECT COUNT(escape_attempts) FROM animals WHERE neutered='0';
SELECT MIN(weight_kg) FROM animals WHERE species='digimon';
SELECT MAX(weight_kg) FROM animals WHERE species='digimon';
SELECT MIN(weight_kg) FROM animals WHERE species='pokemon';
SELECT MAX(weight_kg) FROM animals WHERE species='pokemon';
SELECT AVG(escape_attempts) FROM animals WHERE (species='digimon') AND(date_of_birth BETWEEN '1990.01.01' AND '2000.12.31');
SELECT AVG(escape_attempts) FROM animals WHERE (species='pokemon') AND(date_of_birth BETWEEN '1990.01.01' AND '2000.12.31');

SELECT animal_name FROM animals
JOIN owners ON animals.owners_id = owners.owners_id
WHERE owners.full_name = 'Melody Pond';

SELECT animal_name FROM animals
JOIN species ON animals.species_id = species.species_id
WHERE species.species_name = 'Pokemon';

SELECT owners.full_name, animals.animal_name FROM animals
LEFT JOIN owners ON animals.owners_id = owners.owners_id;
WHERE animals.owners_id IS NOT NULL AND (animals.owners_id IS NULL);

SELECT species.species_name, COUNT(animals.animal_name) FROM animals
JOIN species ON animals.species_id = species.species_id
GROUP BY species.species_name;

SELECT animals.animal_name FROM animals
JOIN species ON animals.species_id = species.species_id
WHERE species.species_name = 'Digimon' AND animals.owners_id = 2;

SELECT animal_name FROM animals
WHERE owners_id = 5 AND escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.animal_name) FROM animals
JOIN owners ON animals.owners_id = owners.owners_id
GROUP BY owners.full_name;

SELECT visits.vets_id, visits.animals_id, MAX(visits.visit_date) FROM visits
WHERE  visits.vets_id = 1
GROUP BY visits.vets_id, visits.animals_id;

SELECT DISTINCT visits.vets_id, visits.animals_id FROM visits
WHERE  visits.vets_id = 3
GROUP BY visits.vets_id, visits.animals_id;

SELECT * FROM specializations

SELECT visits.vets_id, visits.animals_id FROM visits
WHERE  visits.vets_id = 3 AND (visits.visit_date BETWEEN '2020.04.01' AND '2020.08.30')
GROUP BY visits.vets_id, visits.animals_id;

SELECT visits.animals_id, COUNT(visits.vets_id) total_visits FROM visits
GROUP BY visits.animals_id;

SELECT visits.vets_id, visits.animals_id, MIN(visits.visit_date) FROM visits
WHERE  visits.vets_id = 2
GROUP BY visits.vets_id, visits.animals_id;

SELECT animals.animal_name animals, vets.vets_name vets, visit_date FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.vets_id
GROUP BY animals, vets, visit_date;

SELECT species.species_name, COUNT(visits.animals_id) FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN species ON animals.species_id = species.species_id
JOIN vets ON visits.vets_id = vets.vets_id
WHERE vets.vets_name = 'Maisy Smith'
GROUP BY species.species_name;

SELECT vets.vets_name, COUNT(visits.animals_id) FROM visits
JOIN vets ON visits.vets_id = vets.vets_id
JOIN animals ON visits.animals_id = animals.id
JOIN species ON animals.species_id = species.species_id
GROUP BY vets.vets_name;