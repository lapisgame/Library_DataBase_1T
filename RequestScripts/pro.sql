/*Напишите sql запрос, который определяет, терял ли определенный читатель книги.*/
SELECT *
FROM (SELECT 
			reader_ticket_number, 
			r_surname, 
			r_name, 
			r_patronymic, 
			(CASE WHEN 2 IN (SELECT reader_ticket_number FROM damage_loss) THEN 'Должен' ELSE 'Не_должен' END) AS StatusDolga,
			(SELECT COUNT(*) FROM damage_loss WHERE reader_ticket_number = 2) AS KolVoDolga
			FROM reader) AS dad
WHERE reader_ticket_number = 2

/*При потере книг количество доступных книг фонда меняется. Напишите sql запрос на обновление соответствующей информации.*/
UPDATE book
SET quantity = quantity-1
WHERE book_id = 1

/*Определить сумму потерянных книг по каждому кварталу в течение года.*/
SELECT SUM(CASE WHEN (return_date>='2023-01-01' AND return_date <='2023-03-31') THEN COST ELSE 0 END) AS Квартал_1,
	   SUM(CASE WHEN (return_date>='2023-04-01' AND return_date <='2023-06-30') THEN COST ELSE 0 END) AS Квартал_2,
	   SUM(CASE WHEN (return_date>='2023-07-01' AND return_date <='2023-09-30') THEN COST ELSE 0 END) AS Квартал_3,
	   SUM(CASE WHEN (return_date>='2023-10-01' AND return_date <='2023-12-31') THEN COST ELSE 0 END) AS Квартал_4
FROM damage_loss