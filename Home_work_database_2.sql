CREATE TABLE IF NOT EXISTS genres(
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50) NOT NULL UNIQUE);
	
CREATE TABLE IF NOT EXISTS artists(
	id SERIAL PRIMARY KEY,
	artist_name VARCHAR(50) NOT NULL UNIQUE);
	
CREATE TABLE IF NOT EXISTS genres_artists(
	genre_id INTEGER REFERENCES genres(id),
	artist_id INTEGER REFERENCES artists(id),
	CONSTRAINT genres_artists_fk PRIMARY KEY (genre_id, artist_id));
	
CREATE TABLE IF NOT EXISTS albums(
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(50) NOT NULL,
	album_data INTEGER NOT NULL);
	
CREATE TABLE IF NOT EXISTS artists_albums(
	artist_id INTEGER REFERENCES artists(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT artists_albums_fk PRIMARY KEY (artist_id, album_id));
	
CREATE TABLE IF NOT EXISTS tracks(
	id SERIAL PRIMARY KEY,
	track_name VARCHAR(50) NOT NULL,
	track_time INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES albums(id));
	
CREATE TABLE IF NOT EXISTS collections(
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(50) NOT NULL,
	collection_data INTEGER NOT NULL);
	
CREATE TABLE IF NOT EXISTS tracks_collections(
	track_id INTEGER REFERENCES tracks(id),
	collection_id INTEGER REFERENCES collections(id),
	CONSTRAINT collections_tracks_fk PRIMARY KEY (track_id, collection_id));
	
