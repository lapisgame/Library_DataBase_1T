Добавленные сущности:

1) Ущерб/Утеря (данные запоняемые при возврате книги, находящейся в не надлежащем состоянии или утерянной)

2) Сотрудник (данные на сотрудника, код используется для идентификации сотрудника в момент проведения операции)

3) Выдача книги (данные заполняемые при выдачи конкретной книги)
--------------------------------------------------------------------------------------------------------

КНИГИ
Первичный ключ - Шифр книги

Связи:
1) Выдача книги (1 to many, Одинаковые книги могут быть выданы разным людям)
   
2) Ущерб/Утря при возврате (1 to many, Одинаковые книги могут быть Утерены/Повреждены разными людьми)
--------------------------------------------------------------------------------------------------------

АВТОР
Первичный ключ - Код автора

Связи:
1) Книга (1 to many, Одна книга может иметь много авторов)
--------------------------------------------------------------------------------------------------------

ИЗДАТЕЛЬСТВО
Первичный ключ - Код издательства

Связи:
1) Книга (1 to many, одно издательство может иметь несколько книг)

2) Автор (many to many, У многих издательств может быть много авторов)
--------------------------------------------------------------------------------------------------------

СОТРУДНИК
Первичный ключ - Код сотрудника

Связи:
1) Выдача книги (1 to many, Один сотрудник может делать много выдач)

2) Утеря/Ущерб при возврате (1 to many, Один сотрудник может принимать много возвратов)
--------------------------------------------------------------------------------------------------------

ВЫДАЧА КНИГИ
Первичный ключ - Код выдачи

Связи:
1) Читатель (1 to many, Один читатель может иметь много выданных книг)
--------------------------------------------------------------------------------------------------------

ЧИТАТЕЛЬ
Первичный ключ - Номер читательского билета

Связи:
1) Ущерб/Утеря при возврате (1 to many, один читатель может числиться в нескольких ущербах)

2) Выдача книги (1 to many, у одного читателя может быть много выдач)
--------------------------------------------------------------------------------------------------------

УЩЕРБ/УТЕРЯ ПРИ ВОЗВРАТЕ
Первичный ключ - Код Ущерба/Утери

Связи:
1) Читатель (1 to many, у одного читателя может быть много потерь)