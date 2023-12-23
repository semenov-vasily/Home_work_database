-- Задание 2
-- 1. Название и продолжительность самого длительного трека.
SELECT track_name, track_duration  FROM tracks
    WHERE track_duration = (SELECT max(track_duration) FROM tracks)
	ORDER BY track_name;
-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name FROM tracks 
	WHERE track_duration >= 210;
-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name FROM collections 
	WHERE collection_date BETWEEN 2018 and 2020;
-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT artist_name FROM artists
	WHERE artist_name NOT LIKE '%% %%';
-- 5. Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM tracks
	WHERE track_name LIKE '%%My%%';

-- Задание 3
-- 1. Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(genres_artists.artist_id) FROM genres
   JOIN genres_artists ON genres.genre_id = genres_artists.genre_id
   GROUP BY genres.genre_name;
-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT album_name, albums.album_date , COUNT(tracks.track_id) FROM albums
   JOIN tracks ON albums.album_id = tracks.album_id
   WHERE albums.album_date BETWEEN 2019 and 2020
   GROUP BY albums.album_name, albums.album_date;
-- 3. Средняя продолжительность треков по каждому альбому.
SELECT album_name, ROUND(AVG(tracks.track_duration),2) FROM albums
	JOIN tracks ON albums.album_id = tracks.album_id
	GROUP BY albums.album_name;
-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist_name FROM artists
   EXCEPT SELECT artists.artist_name FROM artists
   JOIN albums_artists ON artists.artist_id = albums_artists.artist_id
   JOIN albums ON albums.album_id = albums_artists.album_id
   WHERE albums.album_date=2020;
-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection_name FROM collections
   JOIN tracks_collections ON collections.collection_id = tracks_collections.collection_id
   JOIN tracks ON tracks.track_id = tracks_collections.track_id
   JOIN albums ON albums.album_id = tracks.album_id
   JOIN albums_artists ON albums.album_id = albums_artists.album_id
   JOIN artists ON artists.artist_id = albums_artists.artist_id
   WHERE artists.artist_name LIKE '%Modern Talking%';
   
  -- Задание 4 albums=a, artists=ar, albums_artists=aa, tracks=t, genres=g, genres_artists=ga
-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album_name FROM albums a
	JOIN albums_artists aa ON a.album_id = aa.album_id
	JOIN artists ar ON ar.artist_id = aa.artist_id
	JOIN genres_artists ga ON ga.artist_id = ar.artist_id
	JOIN genres g ON g.genre_id = ga.genre_id
	GROUP BY ar.artist_name, a.album_name
    HAVING COUNT(ga.genre_id) > 1;
-- 2. Наименования треков, которые не входят в сборники.
SELECT track_name FROM tracks t
	LEFT JOIN  tracks_collections tc ON t.track_id = tc.track_id
	WHERE tc.track_id IS null;
-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT artist_name, track_duration FROM artists ar
	JOIN albums_artists aa ON ar.artist_id = aa.artist_id
	JOIN albums a ON a.album_id = aa.album_id
	JOIN tracks t ON t.album_id = a.album_id
	WHERE track_duration = (SELECT min(track_duration) FROM tracks);
-- 4. Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name , COUNT(t.track_id) FROM albums a
    JOIN tracks t ON a.album_id = t.album_id
    GROUP BY a.album_name
    HAVING count(t.track_id) in (
    	SELECT count(t.track_id) FROM albums a
    	JOIN tracks t ON a.album_id = t.album_id
        GROUP BY a.album_name
        ORDER BY count(t.track_id)
        LIMIT 1);