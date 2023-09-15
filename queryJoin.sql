/* Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
SELECT `students`.`name`,
    `students`.`surname`,
    `degrees`.`name` AS "Corso"
FROM `students`
    INNER JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";
/* Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
 Neuroscienze */
SELECT *
FROM `departments`
    INNER JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
    AND `degrees`.`level` = "magistrale";
/* Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
SELECT *
FROM `teachers`
    INNER JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = "44";
/*  Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
 sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
 nome */
SELECT *
FROM `students`
    INNER JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
    INNER JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`,
    `students`.`surname`;
/* Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */
SELECT `degrees`.`name` AS "Corso di Laurea",
    `courses`.`name` AS "Corsi",
    `teachers`.`name` AS "Nome insegnante",
    `teachers`.`surname` AS "Cognome insegnante"
FROM `degrees`
    INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;
/* Selezionare tutti i docenti che insegnano nel Dipartimento di
 Matematica (54) */
SELECT `departments`.`name` AS "Dipartimento",
    `teachers`.`name` AS "Nome Docente",
    `teachers`.`surname` AS "Cognome Docente"
FROM `departments`
    INNER JOIN `degrees` ON `degrees`.`department_id` = `departments`.`id`
    INNER JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
    INNER JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
    INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";