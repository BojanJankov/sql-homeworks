

--Calculate the count of all songs in the system
select s.name, count(*) as total_songs
from song s
group by s."name";

--Calculate the count of all songs per artist in the system
select a.name, count(s.id) as song_count from artist a  
join song s 
on s.artist_id  = a.id 
group by a."name";

--Calculate the count of all songs per artist in the system for first 100 albums
--(ID < 100)
select a.name, count(s.id) as song_count from artist a  
join song s on s.artist_id  = a.id 
join album a2 on a2.id = s.album_id 
where a2.id < 100
group by a."name";

--Find the maximal duration and the average duration per song for each artist
select a.name as artist_name, max(s.duration) as max_duration, avg(s.duration) as average_duration  from artist a 
join song s on s.artist_id = a.id 
group by a.name;
--Calculate the count of all songs per artist in the system and filter only song
--count greater than 10
select a.name, count(s.id) as songs_count from artist a 
left join song s on s.artist_id = a.id 
group by a."name"
having count(s.id) > 10;
--Calculate the count of all songs per artist in the system for first 100 albums
--(ID < 100) and filter artists with more than 10 song count
select a.name, count(s.id) as song_count from artist a  
join song s on s.artist_id  = a.id 
join album a2 on a2.id = s.album_id 
where a2.id < 100
group by a."name"
having count(s.artist_id) > 10; 

--Find the song count, maximal duration, and the average duration per artist on
--all songs in the system. Filter only records where maximal duration is more
--than the average duration
select a.name as artist_name, count(s.id) as song_count, max(s.duration) as max_duration, avg(s.duration) as average_duration  from artist a 
join song s on s.artist_id = a.id 
group by a."name" 
having max(s.duration) > avg(s.duration); 

--Create a new view (vw_ArtistSongCounts) that will list all artist IDs and count
--of songs per artist

create view vw_ArtistSongCounts
as
select a.id as artist_ids, count(s.id) as songs_count from artist a 
join song s on s.artist_id = a.id
group by a.id;

select * from vw_ArtistSongCounts;


-- Slednive dve ne mi se jasni, bidejki nikade ne mozam da pronajdam objasnuvanje vo prezentacijata i vo github skriptata

--Change the view to show artist names instead of artist ID

--List all rows from the view ordered by the biggest song count


--Create a new view (vw_ArtistAlbumDetails) that will list all artists (name) and
--count the albums they have

--Ovde mi e komentirano bidejki vo album nemame relacija so artist id i zatoa ne mozi da se napravi view so taa relacija, napisav kako bi trebalo da izgleda kodot za kreiranje na toa view

--create view vw_ArtistAlbumDetails 
--as
--select a.name as artist_name, count(a2.id) as album_count from artist a 
--join album a2 on a.id = a2.artist_id
--group by a.name;




