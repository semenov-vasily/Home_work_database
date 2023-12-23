CREATE TABLE IF NOT EXISTS genres (
	genre_id serial PRIMARY KEY,
	genre_name varchar(100) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS artists (
	artist_id serial PRIMARY KEY,
	artist_name varchar(100) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS genres_artists (
	genre_id integer REFERENCES genres(genre_id),
	artist_id integer REFERENCES artists(artist_id),
	CONSTRAINT genres_artists_pk PRIMARY KEY (genre_id, artist_id));

CREATE TABLE IF NOT EXISTS albums (
	album_id serial PRIMARY KEY,
	album_name varchar(100) NOT NULL,
	album_date integer NOT NULL);

CREATE TABLE IF NOT EXISTS albums_artists (
	album_id integer REFERENCES albums(album_id),
	artist_id integer REFERENCES artists(artist_id),
	CONSTRAINT albums_artists_pk PRIMARY KEY (album_id, artist_id));

CREATE TABLE IF NOT EXISTS tracks (
	track_id serial PRIMARY KEY,
	track_name varchar(100) NOT NULL,
	track_duration integer NOT NULL,
	album_id integer REFERENCES albums(album_id));

CREATE TABLE IF NOT EXISTS collections (
	collection_id serial PRIMARY KEY,
	collection_name varchar(100) NOT NULL,
	collection_date integer NOT NULL);

CREATE TABLE IF NOT EXISTS tracks_collections (
	track_id integer REFERENCES tracks(track_id),
	collection_id integer REFERENCES collections(collection_id),
	CONSTRAINT track_collection_pk PRIMARY KEY (track_id, collection_id));