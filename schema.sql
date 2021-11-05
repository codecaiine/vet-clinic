CREATE TABLE animals (
  id BIGSERIAL PRIMARY KEY,
  animal_name VARCHAR(150),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BIT,
  weight_kg DECIMAL,
  species_id INT,
  owners_id INT,
  FOREIGN KEY(species_id) REFERENCES species(species_id),
  FOREIGN KEY(owners_id) REFERENCES owners(owners_id)
);

CREATE TABLE owners (
  owners_id BIGSERIAL PRIMARY KEY,
  full_name VARCHAR(150),
  age INT
);

CREATE TABLE species (
  species_id BIGSERIAL PRIMARY KEY,
  species_name VARCHAR(150)
);