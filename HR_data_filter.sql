SELECT 
    CASE
        WHEN age >= 18 AND age <= 24 THEN '18-24'
        WHEN age >= 25 AND age <= 34 THEN '25-34'
        WHEN age >= 35 AND age <= 44 THEN '35-44'
        WHEN age >= 45 AND age <= 54 THEN '45-54'
        WHEN age >= 55 AND age <= 64 THEN '55-64'
        ELSE '65+'
    END AS age_group,gender,
    COUNT(*) AS count
FROM hr
WHERE age >= 18 
  AND termdate = '0000-00-00'
GROUP BY age_group,gender
order by age_group,gender;
		
        
        
        SELECT 
    CASE
        WHEN age >= 18 AND age <= 24 THEN '18-24'
        WHEN age >= 25 AND age <= 34 THEN '25-34'
        WHEN age >= 35 AND age <= 44 THEN '35-44'
        WHEN age >= 45 AND age <= 54 THEN '45-54'
        WHEN age >= 55 AND age <= 64 THEN '55-64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS count
FROM hr
WHERE age >= 18 
  AND termdate = '0000-00-00'
GROUP BY age_group
order by age_group;


select
round(avg(timestampdiff(year,hire_date,termdate)),0) as average_emp_time
from hr
where termdate<= curdate() and termdate <> '0000-00-00' and age >='18';


select department,gender,count(*) as count
from hr 
WHERE age >= 18 
  AND termdate = '0000-00-00'
group by department,gender
order by department;

select jobtitle,count(*) as count
from hr
WHERE age >= 18 
  AND termdate = '0000-00-00'
  group by jobtitle
  order by jobtitle desc;
  
select department,
terminated_count,
total_count,
terminated_count/total_count as termination_rate
from(
   select department,
   count(*) as total_count,
   sum(case when  termdate<= curdate() and termdate <> '0000-00-00' then 1 else 0 end) as terminated_count
   from hr
   where age >= 18
   group by department
   ) as subquery
   order by termination_rate desc;



select location_state,count(*) as count
from hr
WHERE age >= 18 
  AND termdate = '0000-00-00'
group by location_state
order by count desc;
  
select year,
hires,
terminations,
hires - terminations as net_change,
round((hires - terminations)/hires*100,2) as net_change_percentage
from(
select 
year(hire_date) as year,
count(*) as hires,
sum(case when  termdate<= curdate() and termdate <> '0000-00-00' then 1 else 0 end) as terminations
from hr
WHERE age >= 18 
group by year(hire_date)
) as subquery
order by year asc;



select department, round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
from hr
where termdate<= curdate() and termdate <> '0000-00-00' and age >=18
group by department;
 

  




 