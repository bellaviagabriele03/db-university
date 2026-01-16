



-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia


select students.name as student_name, students.surname as student_surname, degrees.name as degree_name
from students
inner join degrees 
on students.degree_id = degrees.id
where degrees.name = "corso di laurea in economia"



-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze


select degrees.name as degree_name, departments.name as department_name
from degrees
inner join departments
on degrees.department_id = departments.id
where departments.name = "dipartimento di neuroscienze" and degrees.level = "magistrale"


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)


select courses.name
from teachers
inner join course_teacher 
on teachers.id = course_teacher.teacher_id
inner join courses 
on courses.id = course_teacher.course_id
where teachers.id = 44

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il  relativo dipartimento, in ordine alfabetico per cognome e nome


select students.surname as student_surname, students.name as student_name, degrees.name as degree_name, departments.name as depart_name
from students
inner join degrees 
on students.degree_id = degrees.id
inner join departments 
on departments.id = degrees.department_id 
order by students.surname



-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti






-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


select distinct teachers.name as teacher_name, teachers.surname as teacher_surname, departments.name as department_name 
from teachers
inner join course_teacher 
on teachers.id = course_teacher.teacher_id
inner join courses 
on course_teacher.course_id = courses.id
inner join degrees 
on courses.degree_id = degrees.id
inner join departments 
on degrees.department_id = departments.id 
where departments.name = "dipartimento di matematica"



-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esam