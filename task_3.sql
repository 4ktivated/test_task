-- 3. Есть несколько городов. В каждом городе есть несколько парковок, на каждой парковке - несколько паркомест.
--  У каждого города есть название, у каждой парковки - название и площадь, у паркоместа - номер, занятость (занято \ свободно)
--  - Опишите, как бы вы организовали структуру БД для работы с паркоместами в городах.
--  - Напишите SQL запросы для создания данных таблиц и столбцов в них
--  - Выведите одним SQL запросом кол-во свободных паркомест на N-парковке города X
--   - Предложите два варианта такого запроса.
--   - Какой из вариантов будет быстрее работать?

--Описание логики
/*
    Для посторения таблицы нам понадобится 3 таблицы(Города(city), Парковки(city_parking), Места на раковках(parking_spot))
    Таблица Города(city) самая простая в логике содержит имя города и его идентификатор
    Таблица Парковки(city_parking) содержит уникальный идентификатор парковки из комбинации названия парковки и city_id, так же площадь парковки
    Таблица Места на раковках(parking_spot) содержит parking_id из таблицы city_parking, номер места и статус места(занято/свободно),
    для каждого места логично есть его статус и parking_id парковки к которой место пренадлежит
*/


-- DDL
CREATE TABLE public.city (
    city_id int NOT null PRIMARY KEY,
    city varchar NOT NULL
	);

CREATE TABLE public.city_parking (
    parking_id int NOT null PRIMARY KEY,
    parking_name varchar NOT NULL,
    city_id int NOT NULL,
    square int NOT NULL,

    CONSTRAINT city_id_p
        FOREIGN KEY(city_id) 
            REFERENCES public.city(city_id)
    );

CREATE TABLE public.parking_spot (
    id int NOT null PRIMARY KEY,
    parking_id int NOT NULL,
    spot_number int NOT NULL,
    spot_status bool NOT NULL,
    CONSTRAINT park_id_spot
        FOREIGN KEY(parking_id) 
            REFERENCES public.city_parking(parking_id)
    );

--Запрос
select city_parking.parking_id, city_parking.parking_name, city.city , count(parking_spot.spot_status) as  "Колличество свободных мест" from city_parking 
inner join city on city_parking.city_id = city.city_id
inner join parking_spot on city_parking.parking_id = parking_spot.parking_id
where parking_spot.spot_status = false and city.city = 'пермь' and  city_parking.parking_name = 'мега'
group by city_parking.parking_id, city.city, city_parking.parking_name
;