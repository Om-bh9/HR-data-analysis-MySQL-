SELECT * FROM HR.human LIMIT 5;

ALTER TABLE HR.human MODIFY COLUMN birthdate DATE;

UPDATE HR.human
SET hire_date = CASE
  WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
  WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%y'), '%Y-%m-%d')
  ELSE NULL
END

ALTER TABLE HR.human MODIFY COLUMN hire_date DATE;

UPDATE HR.human
SET termdate = DATE_FORMAT(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d %H:%i:%s UTC')
WHERE termdate IS NOT NULL AND termdate != ' ' AND termdate != '';



SELECT termdate FROM HR.human LIMIT 10;

ALTER TABLE HR.human MODIFY COLUMN termdate DATE;

ALTER TABLE HR.human ADD COLUMN age INT;
UPDATE HR.human SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());


SELECT 
  MIN(age) AS youngest,
  MAX(age) AS oldest
FROM HR.human;

SELECT COUNT(*) FROM HR.human WHERE age <18

DELETE FROM HR.human where age < 18;

SELECT COUNT(*)
FROM HR.human
WHERE termdate > CURDATE()


SELECT COUNT(*)
FROM HR.human
WHERE termdate = '0000-00-00'

SELECT gender, count(*) as count from HR.human group by gender;

SELECT race, COUNT(*) AS count FROM HR.human GROUP BY race ORDER BY count DESC;

SELECT MIN(age) AS youngest, MAX(age) as oldest FROM HR.human;

SELECT
  CASE
    WHEN age >= 18 and age <=24 THEN '18-24'
    WHEN age >= 25 and age <=34 THEN '25-34'
    WHEN age >= 35 and age <=44 THEN '35-44'
    WHEN age >= 45 and age <=54 THEN '45-54'
    WHEN age >= 55 and age <=64 THEN '55-64'
    ELSE '65+'
  END AS age_group,
  COUNT(*) AS count FROM HR.human GROUP BY age_group ORDER BY age_group;

SELECT
  CASE
    WHEN age >= 18 and age <=24 THEN '18-24'
    WHEN age >= 25 and age <=34 THEN '25-34'
    WHEN age >= 35 and age <=44 THEN '35-44'
    WHEN age >= 45 and age <=54 THEN '45-54'
    WHEN age >= 55 and age <=64 THEN '55-64'
    ELSE '65+'
  END AS age_group, gender,
  COUNT(*) AS count FROM HR.human GROUP BY age_group, gender ORDER BY age_group, gender;

SELECT location, COUNT(*) AS count FROM HR.human GROUP BY location;

SELECT ROUND(AVG(datediff(termdate, hire_date))/365,0) AS avg_lenght FROM HR.human WHERE termdate <= CURRENT_DATE();

SELECT department, gender, COUNT(*) AS count FROM HR.human GROUP BY department, gender ORDER BY department;

SELECT jobtitle, COUNT(*) AS count FROM HR.human GROUP BY jobtitle ORDER BY jobtitle DESC;

SELECT department, COUNT(*) AS total_count,
  SUM(CASE WHEN termdate <= CURDATE() THEN 1 END) AS terminated_count,
  SUM(CASE WHEN termdate IS NULL THEN 1 ELSE 0 END) AS active_count,
  (SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END)/ count(*)) AS termination_rate
FROM HR.human GROUP BY department ORDER BY termination_rate DESC;

SELECT location_state, COUNT(*) AS count FROM HR.human GROUP BY location_state ORDER BY count DESC;

SELECT 
  YEAR(hire_date) AS year,
  COUNT(*) AS hires,
  SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations,
  COUNT(*) - SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) AS net_change,
    ROUND(((COUNT(*) - SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END)) / COUNT(*) * 100),2) AS net_change_percent
FROM HR.human
GROUP BY 
    YEAR(hire_date)
ORDER BY 
    YEAR(hire_date) DESC;

SELECT 
    year, 
    hires, 
    terminations, 
    (hires - terminations) AS net_change,
    ROUND(((hires - terminations) / hires * 100), 2) AS net_change_percent
FROM (
    SELECT 
        YEAR(hire_date) AS year, 
        COUNT(*) AS hires, 
        SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
    FROM HR.human 
    GROUP BY 
        YEAR(hire_date)
) subquery
ORDER BY 
    year ASC;

SELECT 
    YEAR(hire_date) AS year, 
    COUNT(*) AS hires, 
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE NULL END) AS terminations, 
    COUNT(*) - SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE NULL END) AS net_change,
    ROUND(((COUNT(*) - SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE NULL END)) / COUNT(*) * 100),2) AS net_change_percent
FROM 
    HR.human
WHERE age >= 18
GROUP BY 
    YEAR(hire_date)
ORDER BY 
    YEAR(hire_date) ASC;


SELECT count(*) AS total from HR.human WHERE termdate <= CURRENT_DATE() AND termdate != ' ';

SELECT count(*) as total from HR.human where YEAR(termdate) <= '2023';

select count(*) from HR.human WHERE termdate <= 

SELECT count(DISTINCT(termdate)) from HR.human;

select termdate from HR.human where emp_id = '00-0037846' ;


SELECT count(*) from HR.human WHERE termdate != '-' AND termdate <= CURRENT_DATE();
ALTER TABLE HR.human MODIFY COLUMN termdate SET termdate ='-' IF termdate ='';

UPDATE HR.human SET termdate = '-' WHERE termdate = '';


#question 8
SELECT department, count(*) as total_count,
  SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as terminated_count,
  SUM(termdate = '-') AS active_count,
  (SUM(termdate != '-' AND termdate <= CURRENT_DATE())/count(*)) as termination_rate
FROM HR.human GROUP BY department ORDER BY termination_rate ASC;

#question 10
SELECT YEAR(hire_date) AS year,
  Count(*) as hires,
  SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as terminated_count,
  COUNT(*) - SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as net_change,
  ROUND(((count(*)- SUM(termdate != '-' AND termdate <= CURRENT_DATE()))/ count(*) * 100),2) AS net_change_percent
FROM HR.human GROUP BY YEAR(hire_date) ORDER BY YEAR(hire_date) ASC;

#question 11
SELECT department, ROUND(AVG(datediff(CURRENT_DATE(),termdate)/365),0) AS AVG_tenure FROM HR.human WHERE termdate != '-' AND termdate <= CURRENT_DATE() GROUP BY department;