/*Издательство*/
CREATE TABLE IF NOT EXISTS public.publisher(
    publisher_id SERIAL PRIMARY KEY,                    /*Код издательства*/
    title VARCHAR(50) NOT NULL,                         /*Название*/
    city VARCHAR(50) NOT NULL                           /*Город*/
);

/*Автор*/
CREATE TABLE IF NOT EXISTS public.author(
    author_id SERIAL PRIMARY KEY,                               /*Код автора*/
    surname VARCHAR(50) NOT NULL,                               /*Фамилия*/
    name VARCHAR(50) NOT NULL,                                  /*Имя*/
    patronymic VARCHAR(50) NOT NULL,                            /*Отчество*/
    publisher_id SERIAL REFERENCES publisher (publisher_id)     /*Код издательства*/
);

/*Авторы книги*/
CREATE TABLE IF NOT EXISTS public.authors_book(
    authors_id SERIAL PRIMARY KEY,                      /*Код группы авторов*/
    author_id SERIAL REFERENCES author (author_id)      /*Код автора*/
);

/*Книга*/
CREATE TABLE IF NOT EXISTS public.book(
    book_id SERIAL PRIMARY KEY,                             /*Шифр книги*/
    name VARCHAR(50) NOT NULL,                              /*Название*/
    publisher VARCHAR(50) NOT NULL,                         /*Издательство*/
    author SERIAL REFERENCES authors_book (authors_id),     /*Авторы книги из authors_book*/
    date_instances DATE NOT NULL,                           /*Год издательства*/
    volume_page SMALLINT NOT NULL,                          /*Количество страниц*/
    cost DECIMAL NOT NULL,                                  /*Стоимость*/
    quantity INT NOT NULL                                   /*Количество на складе*/
);

/*Сотрудник*/
CREATE TABLE IF NOT EXISTS public.employee(
    employee_id SERIAL PRIMARY KEY,                     /*Код сотрудника*/
    surname VARCHAR(50) NOT NULL,                       /*Фамилия*/
    name VARCHAR(50) NOT NULL,                          /*Имя*/
    patronymic VARCHAR(50) NOT NULL,                    /*Отчество*/
    job_position VARCHAR(50) NOT NULL,                  /*Должность*/
    adress VARCHAR(50) NOT NULL,                        /*Адрес*/
    phone_number VARCHAR(50) NOT NULL                   /*Телефон*/
);

/*Читатель*/
CREATE TABLE IF NOT EXISTS public.reader(
    reader_ticket_number SERIAL PRIMARY KEY,                        /*Номер читательского билета*/
    surname VARCHAR(50) NOT NULL,                                   /*Фамилия*/
    name VARCHAR(50) NOT NULL,                                      /*Имя*/
    patronymic VARCHAR(50) NOT NULL,                                /*Отчество*/
    adress VARCHAR(50) NOT NULL,                                    /*Адрес*/
    phone_number VARCHAR(50) NOT NULL                               /*Телефон*/
);

/*Выдача книги*/
CREATE TABLE IF NOT EXISTS public.extradition(
    extradition_id SERIAL PRIMARY KEY,                                      /*Код выдачи*/
    book_id SERIAL REFERENCES book (book_id),                               /*Шифр книги*/
    reader_ticket_number SERIAL REFERENCES reader (reader_ticket_number),   /*Номер читательского билета*/
    date_of_issue DATE NOT NULL,                                            /*Дата выдачи*/
    return_date DATE NOT NULL,                                              /*Дата возврата*/
    real_return_date DATE NOT NULL,                                         /*Фактическая дата возврата*/
    employee_id SERIAL REFERENCES employee (employee_id)                    /*Код сотрудника*/
);

/*Ущерб/Утеря при возврате*/
CREATE TABLE IF NOT EXISTS public.damage_loss(
    damage_id SERIAL PRIMARY KEY,                                           /*Код Ущерба/потери*/
    reader_ticket_number SERIAL REFERENCES reader (reader_ticket_number),   /*Номер читательского билета*/
    book_id SERIAL REFERENCES book (book_id),                               /*Шифр книги*/
    type_or_reason TEXT NOT NULL,                                           /*Вид ущерба или причина утери*/
    cost DECIMAL NOT NULL,                                                  /*Стоимость ущерба*/
    employee_id SERIAL REFERENCES employee (employee_id)                    /*Код сотрудника*/
);