create table customer_info(
cust_id int, Name varchar(50), city varchar(50), Age int, salary numeric
);
Select*from customer_info;
insert into customer_info(cust_id,Name,city,Age,salary)
values
(23451,'Rishika sharma', 'Ranchi',21,30900.90),
(04572,'vanshila raj', 'Pehalgam',24,49872.10),
(2327,'Gomti bhatnagar', 'Bandra',32,342887.32),
(6269,'keshev kumar', 'Karachi',31,134002.23),
(2269,'Tannu viswa', 'Panji',29,98370.35),
(1242,'priya Rathore', 'Bohpal',30,88200.87),
(13431,'Bhusan singh', 'Patna',35,81280.93),
(5566, 'Anjali Sharma', 'Delhi', 26, 88000.00),
(7788, 'Ravi Das', 'Lucknow', 33, 99990.00),
(8888, 'Kavita Chauhan', 'Bangalore', 29, 67000.90);

Select * from customer_info;


SELECT count(DISTINCT name,city) FROM customer_info;     

SELECT count(city) AS customer_count FROM customer_info GROUP BY city;     
SELECT * FROM customer_info WHERE salary>(SELECT AVG(salary) FROM customer_info);

SELECT * FROM customer_info WHERE salary LIKE '%.9';

UPDATE customer_info SET city = 'Bhopal' WHERE cust_id = 1242;
UPDATE customer_info SET salary = 990577.89 WHERE cust_id =7788;
SELECT * from customer_info;
SELECT name,salary, salary*1.10 from customer_info;
Select *, salary*1.10 from customer_info;

SELECT name FROM customer_info WHERE name LIKE 'p%';


SELECT name,city from customer_info WHERE city NOT LIKE'B%';


SELECT * from customer_info WHERE Age BETWEEN 28 AND 35 AND salary>80000;

SELECT name from customer_info WHERE name LIKE'%sh%';

SELECT * from customer_info where city <> 'Patna' AND salary < 100000;


select * from customer_info where city<> 'patna'AND salary <100000;
select AVG(salary) from customer_info;


select * from customer_info where salary> (select AVG(salary) from customer_info);

select * from customer_info order by salary desc limit 1;


select * from customer_info where salary= (select MAX(salary) from customer_info);


SELECT * FROM customer_info WHERE city IN (SELECT city FROM customer_info GROUP by city HAVING COUNT(*) >1);

select * from customer_info order by age asc limit 2;

select city, AVG(salary) as Average_salary from customer_info group by city order by Average_salary desc;

select
(
(select count(*) from customer_info Where age <  30) * 100.0 / count(*))
as percentage_age_below_30 from customer_info;


select '20–25' as Age_group, avg(salary) as Average_salary from customer_info
Where Age between 20 And 25
UNION ALL
select '26–30' as Age_group, avg(salary) as Average_salary from customer_info
Where Age between 26 And 30
UNION ALL
select '31–35' as Age_group, avg(salary) as Average_salary from customer_info
Where Age between 31 And 35;

select city, avg(salary) as Average_salary from customer_info group by city having Average_salary>90000;

select name, salary, RANK() over (order by salary desc) as Rank_salary from customer_info;

SELECT 
  c.name,
  c.city,
  c.salary,
  city_avg.avg_salary AS city_average_salary,
  c.salary - city_avg.avg_salary AS difference_from_city_avg
FROM 
  customer_info c
JOIN 
  (SELECT city, AVG(salary) AS avg_salary
   FROM customer_info
   GROUP BY city) city_avg
ON 
  c.city = city_avg.city;
  


select name from customer_info where name like '%R'OR name like '%s' OR name like '%t';

