--Название и продолжительность самого длительного трека.
SELECT track_name, track_time 
FROM tracks
WHERE track_time = (SELECT MAX(track_time) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name
FROM tracks
WHERE track_time >= 210
ORDER BY track_name;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name
FROM collections
WHERE collection_data BETWEEN 2018 AND 2020
ORDER BY collection_name;

--Исполнители, чьё имя состоит из одного слова.
SELECT artist_name
FROM artists
WHERE artist_name NOT LIKE '% %'
ORDER BY artist_name;

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name
FROM tracks
WHERE track_name iLIKE '%my%' OR track_name iLIKE '%мой%'
ORDER BY track_name;

--Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(genres_artists.artist_id) FROM genres
JOIN genres_artists ON genres.id = genres_artists.genre_id  
GROUP BY genre_name
ORDER BY genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT album_name, album_data, COUNT(tracks.id) AS tracks FROM albums
JOIN tracks ON tracks.album_id = albums.id 
WHERE album_data BETWEEN 2019 AND 2020
GROUP BY album_name, album_data
ORDER BY album_name;

--Средняя продолжительность треков по каждому альбому.
SELECT album_name, AVG(tracks.track_time) AS avg_time FROM albums
JOIN tracks ON tracks.album_id = albums.id
GROUP BY album_name
ORDER BY avg_time;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT artist_name 
FROM artists 
WHERE artist_name NOT IN (SELECT DISTINCT artist_name 
							FROM artists
							JOIN artists_albums ON artists.id = artists_albums.artist_id 
							JOIN albums ON albums.id = artists_albums.album_id 
							WHERE album_data = 2020)
ORDER BY artist_name;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection_name, artist_name FROM collections
JOIN tracks_collections ON  collections.id = tracks_collections.collection_id 
JOIN tracks ON  tracks.id = tracks_collections.track_id 
JOIN albums ON  albums.id = tracks.album_id 
JOIN artists_albums ON  artists_albums.album_id  = albums.id 
JOIN artists ON  artists.id  = artists_albums.artist_id 
WHERE artist_name = 'Modern Talking'
ORDER BY collection_name;

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album_name, COUNT (genres_artists.genre_id) FROM albums
JOIN artists_albums ON  artists_albums.album_id  = albums.id
JOIN artists ON  artists.id  = artists_albums.artist_id
JOIN genres_artists ON  genres_artists.artist_id  = artists.id
JOIN genres ON  genres.id  = genres_artists.genre_id 
GROUP BY artist_name, album_name
HAVING COUNT(genres_artists.genre_id) > 1;

--Наименования треков, которые не входят в сборники.
SELECT track_name FROM tracks
LEFT JOIN tracks_collections ON  tracks.id = tracks_collections.track_id 
WHERE tracks_collections.track_id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT artist_name, track_time FROM artists
JOIN artists_albums ON  artists_albums.artist_id  = artists.id 
JOIN albums ON  albums.id = artists_albums.album_id 
JOIN tracks ON  tracks.album_id  = albums.id 
WHERE track_time = (SELECT MIN(track_time) FROM tracks)
ORDER BY artist_name;

--Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name, COUNT(tracks.id) FROM albums
JOIN tracks ON  tracks.album_id  = albums.id 
GROUP BY album_name
HAVING COUNT(tracks.id) IN (SELECT COUNT(tracks.id) FROM albums
							JOIN tracks ON  tracks.album_id  = albums.id
							GROUP BY album_name
							ORDER BY COUNT(tracks.id)
							LIMIT 1)
ORDER BY album_name;							







