INSERT INTO genres (genre_name)
	VALUES ('Disco'), ('Rock'), ('Heavy Metal'), ('Blues'), ('House');

INSERT INTO artists (artist_name)
	VALUES ('Modern Talking'),('ABBA'),
			('Queen'),('Pink Floyd'),
			('Metallica'),('Manowar'),
			('Chuck Berry'),('Chris Rea'),
			('Doctorspook');
		
INSERT INTO genres_artists (genre_id, artist_id)
	VALUES (1,1), (1,2),
			(2,3), (2,4),
			(3,5), (3,6),
			(4,7), (4,8),
			(5,9), (2,9);
		
INSERT INTO albums (album_name, album_data)
	VALUES ('In the Middle of Nowhere',1986), ('Romantic Warriors',1987),
			('Arrival',1976), ('Super Trouper',1980),
			('A Night at the Opera',1975), ('A Kind of Magic',1986),
			('Ummagumma',1969), ('The Dark Side of the Moon',1973),
			('Master of Puppets',1986), ('Load',2018),
			('Warriors Of The World',2002), ('Gods of War',2020),
			('St. Louis to Liverpool',1964), ('Bio',1973),
			('On the Beach',1986), ('Auberge',1991),
			('Deep House', 2021);
	
INSERT INTO artists_albums (album_id, artist_id)
	VALUES (1,1), (2,1),
			(3,2), (4,2),
			(5,3), (6,3),
			(7,4), (8,4),
			(9,5), (10,5),
			(11,6), (12,6),
			(13,7), (14,7),
			(15,8), (16,8),
			(17,9);

INSERT INTO tracks (track_name, track_time, album_id)
	VALUES ('In Shaire', 222, 1), ('Sweet Little Sheila', 183, 1), ('Jet Airliner', 259, 2), ('Arabian Gold', 223, 2),
			('Dancing Queen', 230, 3), ('Arrival', 180, 3), ('Super Trouper', 265, 4), ('The Piper', 203, 4),
			('Seaside Rendezvous', 135, 5), ('Love of My Life', 219, 5), ('One Vision', 311, 6), ('Gimme the Prize', 274, 6),
			('Astronomy Domine', 509, 7), ('A Saucerful of Secrets', 768, 7), ('Breathe', 283, 8), ('Money', 382, 8),
			('Battery', 313, 9), ('Orion', 508, 9), ('Ronnie', 317, 10), ('Cure', 294, 10),
			('Valhalla', 36, 11), ('Nessun Dorma', 258, 11),	('Sleipnir ', 313, 12), ('Odin', 329, 12),
			('Little Marie', 157, 13), ('You Two', 131, 13), ('Bio', 265, 14), ('Talkin About My Buddy', 416, 14),
			('On the Beach', 304, 15), ('Lucky Day', 237, 15), ('Auberge', 438, 16), ('Every Second Counts', 308, 16),
			('Adrian Feder - Honey Eyes', 275, 17);
		
INSERT INTO collections (collection_name, collection_data)
	VALUES ('Collection_1964', 1964), ('Collection_1969', 1969),
			('Collection_1973', 1973), ('Collection_1975', 1975),
			('Collection_1976', 1976), ('Collection_1980', 1980),
			('Collection_1986', 1986), ('Collection_1987', 1987),
			('Collection_1991', 1991), ('Collection_2002', 2002),
			('Collection_2020', 2020), ('Collection_2021', 2021);
		
INSERT INTO tracks_collections (track_id, collection_id) 
	VALUES (25,1), (26,1), (13,2), (14,2), (15,3), (16,3), (27,3), (28,3), (9,4), (10,4),
			(5,5), (6,5), (7,6), (8,6), (1,7), (2,7), (11,7), (12,7), (17,7), (18,7),
			(29,7), (30,7), (3,8), (4,8), (31,9), (32,9), (20,10), (21,10),
			(23,11), (24,11), (33,12);
