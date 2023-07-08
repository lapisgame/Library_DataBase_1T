/*Определить, сколько книг прочитал каждый читатель в текущем году. Вывести рейтинг читателей по убыванию.*/
SELECT 
	r.reader_ticket_number AS Номер_билета, 
	r_surname AS Фамилия, 
	r_name AS Имя, 
	r_patronymic AS Отчество, 
	COUNT(CASE 
            WHEN ((return_date IS NOT NULL) AND (real_return_date IS NOT NULL) AND (real_return_date > '2022-12-31')) THEN 1 
            ELSE NULL 
        END) AS Колво_прочитанных_книг
FROM public.extradition e 
JOIN public.reader r on e.reader_ticket_number = r.reader_ticket_number
GROUP BY r.reader_ticket_number 
ORDER BY r.reader_ticket_number DESC 

/*Определить, сколько книг у читателей на руках на текущую дату.*/
SELECT 
	r.reader_ticket_number AS Номер_билета, 
	r_surname AS Фамилия, 
	r_name AS Имя, 
	r_patronymic AS Отчество, 
	COUNT(CASE 
            WHEN ((return_date IS NULL) AND (real_return_date IS NULL)) THEN 1 
            ELSE NULL 
        END) AS Колво_книг_на_руках
FROM public.extradition e 
JOIN public.reader r on e.reader_ticket_number = r.reader_ticket_number
GROUP BY r.reader_ticket_number 
ORDER BY r.reader_ticket_number 


/*Определить читателей, у которых на руках определенная книга.*/


/*Определите, какие книги на руках читателей.*/


/*Вывести количество должников на текущую дату. */


/*Книги какого издательства были самыми востребованными у читателей? Отсортируйте издательства по убыванию востребованности книг.*/


/*Определить самого издаваемого автора.*/


/*Определить среднее количество прочитанных страниц читателем за день.*/