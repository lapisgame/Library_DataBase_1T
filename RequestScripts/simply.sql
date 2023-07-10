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
ORDER BY Колво_прочитанных_книг DESC 

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
SELECT 
	e.reader_ticket_number AS Номер_Билета, 
	r.r_surname AS Фамилия, 
	r.r_name AS Имя, 
	r.r_patronymic AS Отчество, 
	b.name AS Название_книги
FROM extradition e
JOIN reader r ON e.reader_ticket_number = r.reader_ticket_number
JOIN book b ON e.book_id = b.book_id 
WHERE ((return_date IS NULL) AND (real_return_date IS NULL) AND e.book_id = 0005)

/*Определите, какие книги на руках читателей.*/
SELECT 
	e.extradition_id AS Номер_выдачи, 
	b.name AS Название_книги
FROM extradition e
JOIN book b ON e.book_id = b.book_id 
WHERE ((return_date IS NULL) AND (real_return_date IS NULL))

/*Вывести количество должников на текущую дату. */
SELECT 
	COUNT(CASE
		WHEN ((e.return_date IS NULL) AND (e.real_return_date IS NULL) AND (e.date_of_issue < (current_date - 14))) THEN 1
		ELSE NULL
	END) AS Должники
FROM extradition e 

/*Книги какого издательства были самыми востребованными у читателей? Отсортируйте издательства по убыванию востребованности книг.*/
SELECT 
	b.publisher AS Код_издательства, 
	p.title AS Название_издательства,
	COUNT(*) as Количество_книг
FROM extradition e
JOIN book b ON e.book_id = b.book_id
JOIN publisher p ON b.publisher = p.publisher_id
GROUP BY publisher, p.title
ORDER BY Количество_книг DESC

/*Определить самого издаваемого автора.*/
SELECT 
	author AS Код_автора,
	a.a_surname AS Фамилия_автора,
	a.a_name AS Имя_автора,
	a.a_patronymic AS Отчество_автора,
	COUNT(*) as Книги_автора
FROM book b
JOIN authors_book ab ON ab.authors_id = b.author 
JOIN author a ON ab.author_id = a.author_id 
GROUP BY author, a.a_surname, a.a_name, a.a_patronymic
ORDER BY Книги_автора DESC
LIMIT 1

/*Определить среднее количество прочитанных страниц читателем за день.*/
SELECT e.extradition_id, e.date_of_issue, e.real_return_date, CASE 
	WHEN ((e.return_date IS NOT NULL) AND (e.real_return_date IS NOT NULL)) 
	THEN (b.volume_page * 1.0 / (e.real_return_date - e.date_of_issue))
	ELSE NULL
END AS AVG_страниц
FROM extradition e 
JOIN book b ON e.book_id = b.book_id 