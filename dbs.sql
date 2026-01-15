-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
select *
from students
where year(date_of_birth) = 1990


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

select *
from courses
where cfu > 10


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

-- soluzione scherzosa xdxdxdxdxd:
select *
from students
where year(date_of_birth) = 1996

-- soluzione seria: cercando ho trovato TIMESTAMPDIFF che calcola sostanzialmente la differenza tra date 
-- selezionando un tipo di unità (es: anno / mese o giorno) e facendo la differenza con la data corrente (curdate()) 
-- sono riuscito a trovare tutti gli studenti che hanno un età > di 30 
--                <3 <3 <3 <3 <3 <3 <3 <3 

select *, timestampdiff(year, date_of_birth, curdate()) as age_of_students
from students
where timestampdiff(year, date_of_birth, curdate()) >= 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di  laurea (286)

select *
from courses
where period = "I semestre" and year = 1 


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

select *
from exams
where hour(hour) >= 14 and date = "2020-06-20"


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

select *
from degrees
where level = "magistrale"


-- 7. Da quanti dipartimenti è composta l'università? (12)

select count(id)
from departments


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50

select count(id) as teachers_without_phone
from teachers
where phone is null