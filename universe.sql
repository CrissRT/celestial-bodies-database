CREATE TABLE galaxy(
    galaxy_id Serial PRIMARY KEY, 
    name VARCHAR(30) UNIQUE, 
    total_stars_multiplied_by_1000 INT NOT NULL, 
    mass_of_galaxy NUMERIC(20,4) NOT NULL, 
    description TEXT
);

CREATE TABLE star_systems(
    star_systems_id SERIAL PRIMARY KEY, 
    galaxy_id INT REFERENCES galaxy(galaxy_id), 
    name VARCHAR(30) UNIQUE, 
    planet_number INT NOT NULL, 
    stars_number INT NOT NULL
);

CREATE TABLE star(
    star_id SERIAL PRIMARY KEY, 
    name VARCHAR(30) UNIQUE, 
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    star_mass INT NOT NULL, 
    is_spherical BOOLEAN,
    star_systems_id INT REFERENCES star_systems(star_systems_id)
);
 
CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY, 
    name VARCHAR(30) UNIQUE, 
    star_id INT REFERENCES star(star_id) NOT NULL, 
    planet_radius INT NOT NULL, 
    has_life BOOLEAN,
    star_systems_id INT REFERENCES star_systems(star_systems_id)
);

CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY, 
    name VARCHAR(30) UNIQUE, 
    planet_id INT REFERENCES planet(planet_id) NOT NULL, 
    crater_count INT, 
    moon_distance_from_planet INT NOT NULL,
    star_systems_id INT REFERENCES star_systems(star_systems_id)
);

-- Insert data into the "galaxy" table
INSERT INTO galaxy (name, total_stars_multiplied_by_1000, mass_of_galaxy, description)
VALUES
    ('Milky Way',   100000000, 1.5, 'Our home galaxy, containing billions of stars.'),
    ('Andromeda',   1000000000, 2, 'A large spiral galaxy, the closest to the Milky Way.'),
    ('Triangulum',  40000000, 4, 'A small spiral galaxy also known as the Pinwheel Galaxy.'),
    ('Messier 87',  100000000, 6.5, 'A giant elliptical galaxy containing a supermassive black hole.'),
    ('Centaurus A', 100000000, 2, 'A peculiar galaxy with a distinctive dust lane.'),
    ('NGC 1300',    100000000, 1, 'A barred spiral galaxy with prominent arms.');

-- Insert data into the "star_systems" table
INSERT INTO star_systems(name, planet_number, stars_number, galaxy_id)
VALUES
    ('Kepler-62', 5, 1, 1),
    ('Solar System', 8, 1, 1),
    ('Alpha Centauri', 5, 3, 1);

-- Insert data into the "star" table
INSERT INTO star(name, star_mass, is_spherical, galaxy_id, star_systems_id)
VALUES
    ('Kepler-62', 0.69, TRUE, 1, 1),
    ('Sun', 1, TRUE, 1, 2),
    ('Alpha Centauri A', 1.1, TRUE, 1, 3),
    ('Alpha Centauri B', 0.9, TRUE, 1, 3),
    ('Proxima Centauri', 0.12, TRUE, 1, 3),
    ('Alpha Centauri C', 0.2, TRUE, 1, 3);

-- Insert data into the "planet" table
INSERT INTO planet (name, planet_radius, has_life, star_id, star_systems_id)
VALUES
    ('Kepler-62b', 1.31, FALSE, 1, 1),
    ('Kepler-62c', 0.54, FALSE, 1, 1),
    ('Kepler-62d', 1.95, FALSE, 1, 1),
    ('Kepler-62e', 1.61, FALSE, 1, 1),
    ('Kepler-62f', 1.41, FALSE, 1, 1),
    ('Jupiter', 69, FALSE, 2, 2),
    ('Earth', 6371, TRUE, 2, 2),
    ('Mars', 3389, FALSE, 2, 2),
    ('Venus', 6051, FALSE, 2, 2),
    ('Mercury', 2439, FALSE, 2, 2),
    ('Saturn', 58, FALSE, 2, 2),
    ('Uranus', 25, FALSE, 2, 2),
    ('Neptune', 24, FALSE, 2, 2);

-- Insert data into the "moon" table
INSERT INTO moon (name, crater_count, moon_distance_from_planet, planet_id, star_systems_id)
VALUES
    ('Callisto', 20, 1883000, 6, 2),
    ('Ganymede', 44, 1070000, 6, 2),
    ('Europa', 34, 671100, 6, 2),
    ('Thebe', 4, 222000, 6, 2),
    ('Amalthea', 30, 181000, 6, 2),
    ('Moon', 400000, 384400, 7, 2),
    ('Phobos', 0, 9378, 8, 2),
    ('Deimos', 0, 23463, 8, 2),
    ('Titan', 0, 1221870, 9, 2),
    ('Triton', 0, 354800, 10, 2),
    ('Iapetus', 0, 3561300, 11, 2),
    ('Rhea', 0, 5270400, 11, 2),
    ('Tethys', 0, 2946600, 11, 2),
    ('Dione', 0, 3774000, 11, 2),
    ('Enceladus', 0, 237948, 11, 2),
    ('Mimas', 0, 185539, 11, 2),
    ('Hyperion', 0, 1481100, 11, 2),
    ('Phoebe', 0, 12952000, 11, 2),
    ('Oberon', 0, 583520, 12, 2),
    ('Miranda', 0, 129390, 13, 2);



SELECT * FROM galaxy;

-- The planet table should have at least 12 rows
SELECT * FROM planet;

-- The moon table should have at least 20 rows
SELECT * FROM moon;

-- The galaxy and star tables should each have at least six rows
SELECT * FROM star;
SELECT * FROM star_systems;
