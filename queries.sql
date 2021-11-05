
/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT point1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO point1;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT weight_kg, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY weight_kg;

SELECT escape_attempts, AVG(escape_attempts) FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY escape_attempts;

SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT name, full_name FROM animals FULL JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(animals.name), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT owners.full_name, animals.name AS animal_name, species.name AS species_name FROM animals JOIN owners ON owners.id = animals.owner_id JOIN species ON species.id = animals.species_id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT name, escape_attempts, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';

SELECT full_name, COUNT(animals.owner_id) as total_animals FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.id ORDER BY total_animals DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id GROUP BY vets.name HAVING vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name AS specialties FROM vets FULL JOIN specializations ON vets.id = specializations.vets_id FULL JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vets.name = 'Stephanie Mendez';

SELECT animals.name, COUNT(animals.id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id GROUP BY animals.name ORDER BY COUNT(animals_id) DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT animals.name AS animal_name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name AS vet_name, vets.age, vets.date_of_graduation, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id JOIN specializations ON specializations.vets_id = vets.id WHERE specializations.species_id <> animals.species_id;

SELECT species.name, COUNT(visits.animals_id) as count FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT dateOfBirth;
UPDATE animals SET weight_kg=-1*weight_kg;
ROLLBACK TO dateOfBirth;
UPDATE animals SET weight_kg=-1*weight_kg WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, count(neutered) as result FROM animals GROUP BY neutered ORDER BY result DESC LIMIT 1;
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name,
owners.full_name FROM animals JOIN owners ON animals.owners_id = owners.id
WHERE full_name = 'MelodyPond';

SELECT animals.name AS animal_name,
species.name AS species_type FROM animals JOIN species ON animals.species_id = species.id
WHERE species.name='Pokemon';

SELECT full_name,
animals.name FROM owners LEFT JOIN animals ON animals.owners_id=owners.id;

SELECT count(animals) FROM animals JOIN species ON animals.species_id=species.id;

SELECT animals.name FROM animals JOIN owners ON animals.owners_id=owners.id WHERE owners.full_name='Jennifer Orwell';

SELECT animals.name, 
animals.escape_attempts FROM animals INNER JOIN owners ON owners.id = animals.owners_id
  WHERE owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

SELECT owners.full_name, 
COUNT(animals.name) AS total_animals FROM owners JOIN animals ON animals.owners_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1;
