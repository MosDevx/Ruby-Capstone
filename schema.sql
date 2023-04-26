CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    last_played_at DATE NOT NULL,
    multiplayer BOOLEAN NOT NULL,
    publish_date DATE,
    source_id INT REFERENCES sources(id),
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    PRIMARY KEY (id),
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id),
);

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
CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    last_played_at DATE NOT NULL,
    multiplayer BOOLEAN NOT NULL,
    publish_date DATE,
    source_id VARCHAR(100) REFERENCES sources(id),
    genre_id VARCHAR(100) REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id VARCHAR(100) REFERENCES labels(id),
    PRIMARY KEY (id),
);

CREATE TABLE genre (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250)
);