CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    last_played_at DATE NOT NULL,
    multiplayer BOOLEAN NOT NULL,
    publish_date DATE,
    source VARCHAR(100) REFERENCES sources(id),
    genre VARCHAR(100) REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label VARCHAR(100) REFERENCES labels(id),
    PRIMARY KEY (id),
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id),
);