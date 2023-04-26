CREATE TABLE music_album (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    on_spotify BOOLEAN,
    publish_date DATE,
    genre_id INT,
    label_id INT,
    source_id INT,
    author_id INT,
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(label_id) REFERENCES label(id),
    FOREIGN KEY(source_id) REFERENCES source(id),
    FOREIGN KEY(author_id) REFERENCES author(id)
);

CREATE TABLE genre (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250)
);