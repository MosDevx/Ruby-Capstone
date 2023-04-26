CREATE TABLE music_album (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    on_spotify BOOLEAN,
    publish_date DATE,
    genre VARCHAR(250),
    label VARCHAR(250),
    source VARCHAR(250),
    author VARCHAR(250),
    genre_id INT,
    FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE genre (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250)
);