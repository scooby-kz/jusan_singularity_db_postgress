# Репо для задании по БД Postgres от JusanSingularity

## 1.Контейнизируем postgress и pgadmin для дольнейшего удобства
Из интересного чтобы скормить сщуетсвующий дамп БД надо добвать простой скрипт в папку /docker-entrypoint-initdb.d/
```
#!/bin/bash
pg_restore -U postgres -d postgres /dump_2.sql
```
## Homework

__Select__
1.	Вывести номер, марку и модели в гараже Таксопарка

Запрос
```sql
select number,brand.name,model.name
from car,brand,model
where car.idbrand = brand.id
and car.idmodel = model.id
```
Ответ

| "number"     | "name"    | "name-2"   |
|--------------|-----------|------------|
| "A006BMW"    | "BMW"     | "X6"       |
| "Z001VIP"    | "BMW"     | "iX"       |
| "KZ002TAA13" | "Hyundai" | "Sonata"   |
| "A865TGH"    | "Hyundai" | "Santa fe" |
| "Z111SVM"    | "Hyundai" | "Santa fe" |
| "Z123AAA"    | "Hyundai" | "Santa fe" |
| "A002CAP"    | "Buggati" | "Divo"     |
| "A001AAA"    | "Ferrari" | "Roma"     |
| "A956TIM"    | "Chery"   | "Tiggo 8"  |
| "Z001CAM"    | "Toyota"  | "Camry"    |
| "B659GHM"    | "Nissan"  | "Almera"   |
___
2.	Вывести все модели BMW в таблице Модель

Query
```sql
select model.name
from model,brand
where brand.id=model.idbrand
and brand.name='BMW'
```
Answer
| "name"    |
|-----------|
| "X6"      |
| "M3"      |
| "5 серия" |
| "iX"      |
___
3.	Вывести клиентов младше 25 лет
```sql
select name,
EXTRACT(YEAR FROM birthdate) As "Year"
from client
WHERE EXTRACT(YEAR FROM birthdate) < 1998;
```
`Таких нету там у всех указан год 1994`
___

4.	Вывести возраст водителей и имя и фамилию

`Запрос`
```sql
select name, lastname, 
EXTRACT(year FROM AGE(NOW(), birthdate)) AS Age
from driver;
```
`Вывод`
| "name"    | "lastname"  | "age" |
|-----------|-------------|-------|
| "Abu"     | "Abu"       | 30    |
| "Tima"    | "Lars"      | 40    |
| "Timur"   | "Timur"     | 23    |
| "Aigerim" | "Aitpaeva"  | 28    |
| "Akhmet"  | "Akhmetov"  | 23    |
| "Tima"    | "Lars"      | 30    |
| "Adlet"   | "Timur"     | 24    |
| "Tima"    | "Lars"      | 30    |
| "Adlet"   | "Timur"     | 24    |
| "Tima"    | "Lars"      | 30    |
| "Adlet"   | "Timur"     | 24    |
| "Tima"    | "Lars"      | 30    |
| "Adlet"   | "Timur"     | 24    |
| "Smagul"  | "Negmatov"  | 30    |
| "Dariya"  | "Negmatova" | 24    |
___

5.	Вывести марку модель и имя и фамилию которые выходят на работу 5 января 2023

```sql
SELECT driver.name AS driver_name, driver.lastname, schedule.dateschedule, schedule.idcar, car.number
FROM driver
JOIN schedule ON driver.id = schedule.iddriver
JOIN car ON schedule.idcar = car.id
where schedule.dateschedule = '2023-01-05';
```
`Answer`
| "Abu"     | "Abu"      | "2023-01-05" | 1 | "A006BMW"    |
|-----------|------------|--------------|---|--------------|
| "Tima"    | "Lars"     | "2023-01-05" | 2 | "Z001VIP"    |
| "Timur"   | "Timur"    | "2023-01-05" | 3 | "KZ002TAA13" |
| "Aigerim" | "Aitpaeva" | "2023-01-05" | 4 | "Z123AAA"    |
| "Akhmet"  | "Akhmetov" | "2023-01-05" | 5 | "Z111SVM"    |
| "Tima"    | "Lars"     | "2023-01-05" | 6 | "A865TGH"    |

6.	Вывести марки и модели которые нет в таблице car
`Zapros`
```sql
SELECT brand.name,model.name
from car
right join brand
on car.idbrand = brand.id
right join model
on brand.id = model.idbrand
where car.id is null;
```
`Otvet`
| "brand"      | "model"       |
|--------------|---------------|
| "Land Rover" | "Range Rover" |
| "Land Rover" | "Discovery"   |
| "Land Rover" | "Defender"    |
| "Ravon"      | "Matiz"       |
| "Ravon"      | "R4"          |
| "Chevrolet"  | "Aveo"        |
| "Chevrolet"  | "Cruze"       |
| "Chevrolet"  | "Niva"        |
---
7.	Вывести марку модель номер авто имя и фамилию водителя и имя и фамилию клиента у которых locationfinish равен Astana-Arena

`Zapros`
```sql
SELECT brand.name, model.name, driver.name, driver.lastname, client.name as client_name, client.lastname as client_lastname
from route
join schedule
on schedule.id = route.idschedule
join client
on client.id = route.idclient
join driver
on driver.id = schedule.iddriver
join car
on car.id = schedule.idcar
join brand
on brand.id = car.idbrand
join model
on model.id = car.idmodel
where route.locationfinish = 'Astana-Arena'
```
`Otvet`
| "brand_name" | "model_name" | "drivers_name" | "drivers_lastname" | "client_name" | "client_lastname" |
|--------------|--------------|----------------|--------------------|---------------|-------------------|
| "BMW"        | "X6"         | "Abu"          | "Abu"              | "Smagul"      | "Negmatov"        |
| "BMW"        | "iX"         | "Tima"         | "Lars"             | "Ahmet"       | "Ahmetov"         |
| "Hyundai"    | "Sonata"     | "Timur"        | "Timur"            | "Tima"        | "Li"              |
| "Hyundai"    | "Santa fe"   | "Aigerim"      | "Aitpaeva"         | "Sahsa"       | "Khan"            |
___
8.	Вывести марку модель номер авто имя и фамилию водителя и имя и фамилию клиента у которых locationfinish равен Astana-Arena и самая дорогая стоймость поездки

`Zapros`
```sql
SELECT brand.name as Brand_name, model.name as Model_name, driver.name as Drivers_name, driver.lastname as Drivers_lastname, 
client.name as client_name, 
client.lastname as client_lastname, (route.costs)
from route
join schedule
on schedule.id = route.idschedule
join client
on client.id = route.idclient
join driver
on driver.id = schedule.iddriver
join car
on car.id = schedule.idcar
join brand
on brand.id = car.idbrand
join model
on model.id = car.idmodel
where route.locationfinish = 'Astana-Arena'
order by route.costs desc
limit 1
```
`Answer`
| "brand_name" | "model_name" | "drivers_name" | "drivers_lastname" | "client_name" | "client_lastname" | "costs" |
|--------------|--------------|----------------|--------------------|---------------|-------------------|---------|
| "Hyundai"    | "Santa fe"   | "Aigerim"      | "Aitpaeva"         | "Sahsa"       | "Khan"            | 5000    |
___

9.	Вывести все машины которые выехали на работу и провели маршрут которые являются бизнес класса
`Zapros`
```sql
select brand.name, model.name, type.name
from schedule
join car
on car.id = schedule.idcar
join brand
on brand.id = car.idbrand
join model
on model.id = car.idmodel
join type
on type.id = car.idtype
where type.name = 'Бизнес'
```
`Answer`
| "name" | "name-2" | "name-3" |
|--------|----------|----------|
| "BMW"  | "X6"     | "Бизнес" |
| "BMW"  | "iX"     | "Бизнес" |
---
10.	Вывести средную стоймость для машин класса Бизнес с разбивкой по дате
`Query`
```sql
select brand.name, model.name, type.name, route.costs, schedule.dateschedule
from schedule
join car
on car.id = schedule.idcar
join brand
on brand.id = car.idbrand
join model
on model.id = car.idmodel
join type
on type.id = car.idtype
join route
on route.idschedule = schedule.id
where type.name = 'Бизнес'
```
`Answer`

| "name" | "name-2" | "name-3" | "costs" | "dateschedule" |
|--------|----------|----------|---------|----------------|
| "BMW"  | "X6"     | "Бизнес" | 3000    | "2023-01-05"   |
| "BMW"  | "iX"     | "Бизнес" | 4000    | "2023-01-05"   |
---
11.	Вывести ФИО клиентов которые провели поездки на машинах марки BMW
`Zapros`
```sql
select brand.name, model.name, type.name, client.name, client.lastname
from schedule
join car
on car.id = schedule.idcar
join brand
on brand.id = car.idbrand
join model
on model.id = car.idmodel
join type
on type.id = car.idtype
join route
on route.idschedule = schedule.id
join client
on client.id = route.idclient
where type.name = 'Бизнес'
``` 
`Вывод`
| "name" | "name-2" | "name-3" | "name-4" | "lastname" |
|--------|----------|----------|----------|------------|
| "BMW"  | "X6"     | "Бизнес" | "Smagul" | "Negmatov" |
| "BMW"  | "iX"     | "Бизнес" | "Ahmet"  | "Ahmetov"  |
---
12.	Вывести общую сумму сколько заработал таксопарк(общая сумма – процент водителей и – 10% налога) по поездкам за 05/01/2023 по разбивкам класса авто если класс не выехал написать 0

`Zapros`
```sql
select type.name, sum(route.costs*0.9)-sum(schedule.procentdriver) as Выручка
from type
join car
on type.id = car.idtype
join schedule
on schedule.idcar = car.id
join route
on schedule.id = route.idschedule
where schedule.dateschedule = '2023-01-05'
group by type.name
```
`Answer`
| "name"    | "Выручка" |
|-----------|-----------|
| "Бизнес"  | 6291.5    |
| "Комфорт" | 1795      |
| "Эконом"  | 4496      |

> `если класс не выехал написать 0` - С этим не разобрался
---



__Insert__

1.	Добавить пассажира со своими данными.
2.	Добавить пассажира с данными пятерых водителей
3.	Добавить новый маршрут для водителя Smagul Negmatov на машине А001ААА процент от поездки добавить 5% и маршрут от Керуена до EXPO по цене 10000 время 6/01/2023 10:20:00 до 6/01/2023 11:00:00
4.	Добавить авто Марки Lamborghini Urus с номером KZ333ZZZ01 типа бизнес


__Update__ 
1.	Изменить всем водителям у кого нет рейтинга на рейтинг 0
2.	Изменить ИИН у водителей у кого ИИН количество символов не равен 12 на 111111111111
3.	Изменить сделать одинаковыми ИИН у клиентов и водителей у кого одинаковые имя и фамилия

__Delete__ 
1.	Удалить бренды и модели которые нет в табилце car 
2.	Удалить клиента с id 1 
3.	Удалить тип авто эконом
