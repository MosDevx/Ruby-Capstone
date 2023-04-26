CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    on_spotify BOOLEAN,
    publish_date DATE,
    genre_id INT,
    FOREIGN KEY(genre_id) REFERENCES genre(id)
);