
SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

alter table hr 
modify column birthdate date;

select birthdate from hr;

describe hr;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr 
add column age int;

update hr
set age = timestampdiff(year,birthdate,curdate());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

select count(*)
from hr
where age <=18;


-- 1. What is the gender breakdown of employees in the company?
select gender,count(*) as count
from hr 
where age>=18 and termdate = '0000-00-00'
group by gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
select race,count(*) as count
from hr 
where age>=18 and termdate = '0000-00-00'
group by race
order by count desc;









