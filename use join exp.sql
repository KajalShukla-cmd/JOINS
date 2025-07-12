use kajals;
select * from salaries;

select experience_level, COUNT(*) as total_emp_2021
from salaries
where work_year = 2021
group by experience_level;

select experience_level, COUNT(*) as WFH_EMP_2021
from salaries
where work_year = 2021 and remote_ratio = 100
group by experience_level;


SELECT T1.experience_level,T1.total_emp_2021,T2.WFH_EMP_2021
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2021
    FROM
        salaries
    WHERE
        work_year = 2021
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2021
    FROM
        salaries
    WHERE
        work_year = 2021 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level;

-- PERCENTAGE USE

SELECT T1.experience_level,T1.total_emp_2021,T2.WFH_EMP_2021,(T2.WFH_EMP_2021)*100/(T1.total_emp_2021) as Percentage_2021
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2021
    FROM
        salaries
    WHERE
        work_year = 2021
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2021
    FROM
        salaries
    WHERE
        work_year = 2021 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level;

-- ROUND

SELECT T1.experience_level,T1.total_emp_2021,T2.WFH_EMP_2021,ROUND((T2.WFH_EMP_2021)*100/(T1.total_emp_2021),2) as Percentage_2021
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2021
    FROM
        salaries
    WHERE
        work_year = 2021
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2021
    FROM
        salaries
    WHERE
        work_year = 2021 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level;

-- CAMPERISION OF 2024

SELECT T1.experience_level,T1.total_emp_2024,T2.WFH_EMP_2024,ROUND((T2.WFH_EMP_2024)*100/(T1.total_emp_2024),2) as Percentage_2024
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2024
    FROM
        salaries
    WHERE
        work_year = 2024
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2024
    FROM
        salaries
    WHERE
        work_year = 2024 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level;
    
    -- JOIN 2021/2024 LOOKIND DIFFERENCE
    
   SELECT * 
   FROM 
   (SELECT T1.experience_level,T1.total_emp_2021,T2.WFH_EMP_2021,ROUND((T2.WFH_EMP_2021)*100/(T1.total_emp_2021),2) as Percentage_2021
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2021
    FROM
        salaries
    WHERE
        work_year = 2021
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2021
    FROM
        salaries
    WHERE
        work_year = 2021 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level) AS T3
    JOIN
    (SELECT T1.experience_level,T1.total_emp_2024,T2.WFH_EMP_2024,ROUND((T2.WFH_EMP_2024)*100/(T1.total_emp_2024),2) as Percentage_2024
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2024
    FROM
        salaries
    WHERE
        work_year = 2024
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2024
    FROM
        salaries
    WHERE
        work_year = 2024 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level) AS T4 ON T3.experience_level = T4.experience_level;
    
    -- Percentage_delta
    
    SELECT T3.experience_level,T3.Percentage_2021,T4.Percentage_2024,CASE WHEN Percentage_2021 < Percentage_2024 THEN 'INCREASE' ELSE 'DECREASE' END AS Percentage_Delta
   FROM 
   (SELECT T1.experience_level,T1.total_emp_2021,T2.WFH_EMP_2021,ROUND((T2.WFH_EMP_2021)*100/(T1.total_emp_2021),2) as Percentage_2021
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2021
    FROM
        salaries
    WHERE
        work_year = 2021
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2021
    FROM
        salaries
    WHERE
        work_year = 2021 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level) AS T3
    JOIN
    (SELECT T1.experience_level,T1.total_emp_2024,T2.WFH_EMP_2024,ROUND((T2.WFH_EMP_2024)*100/(T1.total_emp_2024),2) as Percentage_2024
FROM
    (SELECT 
        experience_level, COUNT(*) AS total_emp_2024
    FROM
        salaries
    WHERE
        work_year = 2024
    GROUP BY experience_level) AS T1
        JOIN
    (SELECT 
        experience_level, COUNT(*) AS WFH_EMP_2024
    FROM
        salaries
    WHERE
        work_year = 2024 AND remote_ratio = 100
    GROUP BY experience_level) AS T2 ON T1.experience_level = T2.experience_level) AS T4 ON T3.experience_level = T4.experience_level;