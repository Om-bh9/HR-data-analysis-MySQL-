<h3> What is the gender breakdown of employees in the company? </h3>
    
    SELECT gender, count(*) as count from HR.human group by gender;
    
<table>
  <thead>
    <tr>
      <th>gender</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Male</td>
      <td>10794</td>
    </tr>
    <tr>
      <td>Female</td>
      <td>9876</td>
    </tr>
    <tr>
      <td>Non-Conforming</td>
      <td>577</td>
    </tr>
  </tbody>
</table>

<h3> What is the race/ethnicity breakdown of employees in the company? </h3>

    SELECT race, COUNT(*) AS count FROM HR.human GROUP BY race ORDER BY count DESC;
    
<table>
  <thead>
    <tr>
      <th>race</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>White</td>
      <td>6057</td>
    </tr>
    <tr>
      <td>Two or More Races</td>
      <td>3508</td>
    </tr>
    <tr>
      <td>Black or African American</td>
      <td>3443</td>
    </tr>
    <tr>
      <td>Asian</td>
      <td>3388</td>
    </tr>
    <tr>
      <td>Hispanic or Latino</td>
      <td>2402</td>
    </tr>
    <tr>
      <td>American Indian or Alaska Native</td>
      <td>1273</td>
    </tr>
    <tr>
      <td>Native Hawaiian or Other Pacific Islander</td>
      <td>1176</td>
    </tr>
  </tbody>
</table>


<h3> What is the age distribution of employees in the company? </h3>

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

<table>
  <thead>
    <tr>
      <th>age_group</th>
      <th>gender</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>18-24</td>
      <td>Female</td>
      <td>1167</td>
    </tr>
    <tr>
      <td>18-24</td>
      <td>Male</td>
      <td>1342</td>
    </tr>
    <tr>
      <td>18-24</td>
      <td>Non-Conforming</td>
      <td>61</td>
    </tr>
    <tr>
      <td>25-34</td>
      <td>Female</td>
      <td>2860</td>
    </tr>
    <tr>
      <td>25-34</td>
      <td>Male</td>
      <td>3058</td>
    </tr>
    <tr>
      <td>25-34</td>
      <td>Non-Conforming</td>
      <td>163</td>
    </tr>
    <tr>
      <td>35-44</td>
      <td>Female</td>
      <td>2700</td>
    </tr>
    <tr>
      <td>35-44</td>
      <td>Male</td>
      <td>3137</td>
    </tr>
    <tr>
      <td>35-44</td>
      <td>Non-Conforming</td>
      <td>159</td>
    </tr>
    <tr>
      <td>45-54</td>
      <td>Female</td>
      <td>2689</td>
    </tr>
    <tr>
      <td>45-54</td>
      <td>Male</td>
      <td>2796</td>
    </tr>
    <tr>
      <td>45-54</td>
      <td>Non-Conforming</td>
      <td>163</td>
    </tr>
    <tr>
      <td>55-64</td>
      <td>Female</td>
      <td>460</td>
    </tr>
    <tr>
      <td>55-64</td>
      <td>Male</td>
      <td>461</td>
    </tr>
    <tr>
      <td>55-64</td>
      <td>Non-Conforming</td>
      <td>31</td>
    </tr>
  </tbody>
</table>

<h3> How many employees work at headquarters versus remote locations? </h3>

    SELECT location, COUNT(*) AS count FROM HR.human GROUP BY location;
    
<table>
  <thead>
    <tr>
      <th>location</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Headquarters</td>
      <td>15992</td>
    </tr>
    <tr>
      <td>Remote</td>
      <td>5255</td>
    </tr>
  </tbody>
</table>


