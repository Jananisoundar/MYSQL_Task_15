-- Create the database
CREATE DATABASE IMDB;
USE IMDB;

-- Create Movies table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    duration INT,
    description TEXT
);

-- Create Media table
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('video', 'image') NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Create Genres table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);


-- Create MovieGenres table (many-to-many relationship between Movies and Genres)
CREATE TABLE MovieGenres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Create Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create Reviews table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT,
    review_text TEXT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Artists table
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE
);

-- Create Skills table
CREATE TABLE Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(255) NOT NULL
);

-- Create ArtistSkills table (many-to-many relationship between Artists and Skills)
CREATE TABLE ArtistSkills (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

-- Create Roles table
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

-- Create MovieRoles table (many-to-many relationship between Movies and Artists with roles)
CREATE TABLE MovieRoles (
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY (movie_id, artist_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Insert sample data into Movies
INSERT INTO Movies (title, release_date, duration, description) VALUES
('Inception', '2010-07-16', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology.'),
('The Matrix', '1999-03-31', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.');

-- Insert sample data into Media
INSERT INTO Media (movie_id, media_type, media_url) VALUES
(1, 'video', 'http://example.com/inception_trailer.mp4'),
(1, 'image', 'http://example.com/inception_poster.jpg'),
(2, 'video', 'http://example.com/matrix_trailer.mp4'),
(2, 'image', 'http://example.com/matrix_poster.jpg');

-- Insert sample data into Genres
INSERT INTO Genres (genre_name) VALUES
('Science Fiction'),
('Action'),
('Thriller');

-- Insert sample data into MovieGenres
INSERT INTO MovieGenres (movie_id, genre_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

-- Insert sample data into Users
INSERT INTO Users (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com');

-- Insert sample data into Reviews
INSERT INTO Reviews (movie_id, user_id, rating, review_text) VALUES
(1, 1, 5, 'Amazing movie with a mind-bending plot!'),
(2, 2, 4, 'Great action and special effects.');

-- Insert sample data into Artists
INSERT INTO Artists (name, birth_date) VALUES
('Leonardo DiCaprio', '1974-11-11'),
('Keanu Reeves', '1964-09-02');

-- Insert sample data into Skills
INSERT INTO Skills (skill_name) VALUES
('Acting'),
('Directing'),
('Stunt Performing');

-- Insert sample data into ArtistSkills
INSERT INTO ArtistSkills (artist_id, skill_id) VALUES
(1, 1),
(2, 1),
(2, 3);

-- Insert sample data into Roles
INSERT INTO Roles (role_name) VALUES
('Lead Actor'),
('Supporting Actor'),
('Director');

-- Insert sample data into MovieRoles
INSERT INTO MovieRoles (movie_id, artist_id, role_id) VALUES
(1, 1, 1),  
(2, 2, 1);  

select * from Movies;
select * from Media;
select * from Genres;
select * from MovieGenres;
select * from Users;
select * from Reviews;
select * from Artists;
select * from Skills;
select * from ArtistSkills;
select * from Roles;
select * from MovieRoles;