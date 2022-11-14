--query select

--1- selezionare tutte le software house americane (3)

select *
from software_houses
where country = 'united states';

--2- selezionare tutti i giocatori della città di 'rogahnland' (2)

select *
from players
where city = 'rogahnland';

--3- selezionare tutti i giocatori il cui nome finisce per "a" (220)

select *
from players
where name like '%a';

--4- selezionare tutte le recensioni scritte dal giocatore con id = 800 (11)

select *
from reviews
where player_id = 800;

--5- contare quanti tornei ci sono stati nell'anno 2015 (9)

select *
from tournaments
where year = 2015;

--6- selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)

select *
from awards
where description like '%facere%';

--7- selezionare tutti i videogame che hanno la categoria 2 (fps) o 6 (rpg), mostrandoli una sola volta (del videogioco vogliamo solo l'id) (287)

select	count(id) as videogames
from category_videogame
where category_id = 2 or category_id = 6
group by videogame_id;

--8- selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)

select *
from reviews
where rating >= 2 and rating <= 4;

--9- selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)

select *
from videogames
where release_date like '%2020%';


--10- selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)

select count(id) as videogames
from reviews
where rating = 5
group by videogame_id;


--*********** bonus ***********

--11- selezionare il numero e la media delle recensioni per il videogioco con id = 412 (review number = 12, avg_rating = 3)

select count(id) as review_number,
	--sum(rating) as rating_sum,
	sum(rating)/count(id) as avg_rating
from reviews
where videogame_id = 412;

--12- selezionare il numero di videogame che la software house con id = 1 ha rilasciato nel 2018 (13

select count(id) as videogame_released
from videogames
where software_house_id = 1
and release_date like '%2018%';

--query con groupby

--1- contare quante software house ci sono per ogni paese (3)

SELECT COUNT(*) as software_houses_per_country
FROM software_houses
GROUP BY country;

--2- contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'id) (500)

SELECT COUNT(*) AS reviews
FROM reviews
GROUP BY videogame_id;

--3- contare quanti videogiochi hanno ciascuna classificazione pegi (della classificazione pegi vogliamo solo l'id) (13)

SELECT COUNT(*) as games_per_pegi
FROM pegi_label_videogame
GROUP BY pegi_label_id;

--4- mostrare il numero di videogiochi rilasciati ogni anno (11)

SELECT COUNT(*) as games_per_year
FROM videogames
GROUP BY YEAR(release_date);


--5- contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'id) (7)

SELECT COUNT(*) as games_per_device
FROM device_videogame
GROUP BY device_id;

--6- ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'id) (500)

select count(id) as review_number,
sum(rating)/count(id) as avg_rating
from reviews
GROUP BY videogame_id
ORDER BY avg_rating DESC;


--query con join

--1- selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)

--2- sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)

--3- mostrare le categorie di ogni videogioco (1718)

--4- selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)

--5- selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)

--6- selezionare categorie e classificazioni pegi dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)

--7- selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 's' (474)

--8- selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)

--9- selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)


--*********** bonus ***********

--10- selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)

--11- selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)

--12- selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)

--13- selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (10)