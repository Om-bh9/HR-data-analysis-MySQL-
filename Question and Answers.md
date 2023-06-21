<h3> 1. What is the gender breakdown of employees in the company? </h3>
    
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

<h3> 2. What is the race/ethnicity breakdown of employees in the company? </h3>

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


<h3> 3. What is the age distribution of employees in the company? </h3>

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

<h3> 4. How many employees work at headquarters versus remote locations? </h3>

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


<h3> 5. What is the average length of employment for employees who have been terminated? </h3>

        SELECT ROUND(AVG(datediff(termdate, hire_date))/365,0) AS avg_lenght FROM HR.human WHERE termdate <= CURRENT_DATE();

 <table>
  <thead>
    <tr>
      <th>avg_length</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>8</td>
    </tr>
  </tbody>
</table>       

<h3> 6. How does the gender distribution vary across departments and job titles? </h3>

        SELECT department, gender, COUNT(*) AS count FROM HR.human GROUP BY department, gender ORDER BY department;

<table>
  <thead>
    <tr>
      <th>department</th>
      <th>gender</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Accounting</td>
      <td>Female</td>
      <td>1462</td>
    </tr>
    <tr>
      <td>Accounting</td>
      <td>Male</td>
      <td>1640</td>
    </tr>
    <tr>
      <td>Accounting</td>
      <td>Non-Conforming</td>
      <td>90</td>
    </tr>
    <tr>
      <td>Auditing</td>
      <td>Female</td>
      <td>23</td>
    </tr>
    <tr>
      <td>Auditing</td>
      <td>Male</td>
      <td>27</td>
    </tr>
    <tr>
      <td>Business Development</td>
      <td>Female</td>
      <td>722</td>
    </tr>
    <tr>
      <td>Business Development</td>
      <td>Male</td>
      <td>798</td>
    </tr>
    <tr>
      <td>Business Development</td>
      <td>Non-Conforming</td>
      <td>49</td>
    </tr>
    <tr>
      <td>Engineering</td>
      <td>Female</td>
      <td>2983</td>
    </tr>
    <tr>
      <td>Engineering</td>
      <td>Male</td>
      <td>3225</td>
    </tr>
    <tr>
      <td>Engineering</td>
      <td>Non-Conforming</td>
      <td>179</td>
    </tr>
    <tr>
      <td>Human Resources</td>
      <td>Female</td>
      <td>820</td>
    </tr>
    <tr>
      <td>Human Resources</td>
      <td>Male</td>
      <td>867</td>
    </tr>
    <tr>
      <td>Human Resources</td>
      <td>Non-Conforming</td>
      <td>40</td>
    </tr>
    <tr>
      <td>Legal</td>
      <td>Female</td>
      <td>134</td>
    </tr>
    <tr>
      <td>Legal</td>
      <td>Male</td>
      <td>158</td>
    </tr>
    <tr>
      <td>Legal</td>
      <td>Non-Conforming</td>
      <td>7</td>
    </tr>
    <tr>
      <td>Marketing</td>
      <td>Female</td>
      <td>230</td>
    </tr>
    <tr>
      <td>Marketing</td>
      <td>Male</td>
      <td>245</td>
    </tr>
    <tr>
      <td>Marketing</td>
      <td>Non-Conforming</td>
      <td>5</td>
    </tr>
    <tr>
      <td>Product Management</td>
      <td>Female</td>
      <td>270</td>
    </tr>
    <tr>
      <td>Product Management</td>
      <td>Male</td>
      <td>338</td>
    </tr>
    <tr>
      <td>Product Management</td>
      <td>Non-Conforming</td>
      <td>15</td>
    </tr>
    <tr>
      <td>Research and Development</td>
      <td>Female</td>
      <td>491</td>
    </tr>
    <tr>
      <td>Research and Development</td>
      <td>Male</td>
      <td>506</td>
    </tr>
    <tr>
      <td>Research and Development</td>
      <td>Non-Conforming</td>
      <td>35</td>
    </tr>
    <tr>
      <td>Sales</td>
      <td>Female</td>
      <td>793</td>
    </tr>
    <tr>
      <td>Sales</td>
      <td>Male</td>
      <td>906</td>
    </tr>
    <tr>
      <td>Sales</td>
      <td>Non-Conforming</td>
      <td>46</td>
    </tr>
    <tr>
      <td>Services</td>
      <td>Female</td>
      <td>770</td>
    </tr>
    <tr>
      <td>Services</td>
      <td>Male</td>
      <td>815</td>
    </tr>
    <tr>
      <td>Services</td>
      <td>Non-Conforming</td>
      <td>33</td>
    </tr>
    <tr>
      <td>Support</td>
      <td>Female</td>
      <td>419</td>
    </tr>
    <tr>
      <td>Support</td>
      <td>Male</td>
      <td>450</td>
    </tr>
    <tr>
      <td>Support</td>
      <td>Non-Conforming</td>
      <td>34</td>
    </tr>
    <tr>
      <td>Training</td>
      <td>Female</td>
      <td>759</td>
    </tr>
    <tr>
      <td>Training</td>
      <td>Male</td>
      <td>819</td>
    </tr>
    <tr>
      <td>Training</td>
      <td>Non-Conforming</td>
      <td>44</td>
    </tr>
  </tbody>
</table>

<h3> 7. What is the distribution of job titles across the company? </h3>

        SELECT jobtitle, COUNT(*) AS count FROM HR.human GROUP BY jobtitle ORDER BY jobtitle DESC;

  <table>
        <tr>
            <th>Job Title</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Web Developer IV</td>
            <td>66</td>
        </tr>
        <tr>
            <td>Web Developer III</td>
            <td>69</td>
        </tr>
        <tr>
            <td>Web Developer II</td>
            <td>74</td>
        </tr>
        <tr>
            <td>Web Developer I</td>
            <td>95</td>
        </tr>
        <tr>
            <td>Web Designer IV</td>
            <td>6</td>
        </tr>
        <tr>
            <td>Web Designer III</td>
            <td>13</td>
        </tr>
        <tr>
            <td>Web Designer II</td>
            <td>4</td>
        </tr>
        <tr>
            <td>Web Designer I</td>
            <td>34</td>
        </tr>
        <tr>
            <td>VP Sales</td>
            <td>5</td>
        </tr>
        <tr>
            <td>VP Quality Control</td>
            <td>43</td>
        </tr>
        <tr>
            <td>VP Product Management</td>
            <td>39</td>
        </tr>
        <tr>
            <td>VP of Training and Development</td>
            <td>1</td>
        </tr>
        <tr>
            <td>VP Marketing</td>
            <td>42</td>
        </tr>
        <tr>
            <td>VP Accounting</td>
            <td>76</td>
        </tr>
        <tr>
            <td>Training Manager</td>
            <td>177</td>
        </tr>
        <tr>
            <td>Trainer III</td>
            <td>173</td>
        </tr>
        <tr>
            <td>Trainer II</td>
            <td>175</td>
        </tr>
        <tr>
            <td>Trainer I</td>
            <td>171</td>
        </tr>
        <tr>
            <td>Tax Accountant</td>
            <td>294</td>
        </tr>
        <tr>
            <td>Systems Administrator IV</td>
            <td>84</td>
        </tr>
        <tr>
            <td>Systems Administrator III</td>
            <td>81</td>
        </tr>
        <tr>
            <td>Systems Administrator II</td>
            <td>66</td>
        </tr>
        <tr>
            <td>Systems Administrator I</td>
            <td>359</td>
        </tr>
        <tr>
            <td>Support Staff III</td>
            <td>19</td>
        </tr>
        <tr>
            <td>Support Staff II</td>
            <td>58</td>
        </tr>
        <tr>
            <td>Support Staff</td>
            <td>94</td>
        </tr>
        <tr>
            <td>Structural Engineer</td>
            <td>293</td>
        </tr>
        <tr>
            <td>Structural Analysis Engineer</td>
            <td>45</td>
        </tr>
        <tr>
            <td>Statistician IV</td>
            <td>2</td>
        </tr>
        <tr>
            <td>Statistician III</td>
            <td>4</td>
        </tr>
        <tr>
            <td>Statistician II</td>
            <td>11</td>
        </tr>
        <tr>
            <td>Statistician I</td>
            <td>12</td>
        </tr>
        <tr>
            <td>Staff Scientist</td>
            <td>31</td>
        </tr>
        <tr>
            <td>Staff Accountant IV</td>
            <td>101</td>
        </tr>
        <tr>
            <td>Staff Accountant III</td>
            <td>90</td>
        </tr>
        <tr>
            <td>Staff Accountant II</td>
            <td>77</td>
        </tr>
        <tr>
            <td>Staff Accountant I</td>
            <td>427</td>
        </tr>
        <tr>
            <td>Solutions Engineer Manager</td>
            <td>206</td>
        </tr>
        <tr>
            <td>Solutions Engineer</td>
            <td>204</td>
        </tr>
        <tr>
            <td>Software Test Engineer IV</td>
            <td>84</td>
        </tr>
        <tr>
            <td>Software Test Engineer III</td>
            <td>82</td>
        </tr>
        <tr>
            <td>Software Test Engineer II</td>
            <td>69</td>
        </tr>
        <tr>
            <td>Software Test Engineer I</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Software Engineer IV</td>
            <td>88</td>
        </tr>
        <tr>
            <td>Software Engineer III</td>
            <td>97</td>
        </tr>
        <tr>
            <td>Software Engineer II</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Software Engineer I</td>
            <td>378</td>
        </tr>
        <tr>
            <td>Software Consultant</td>
            <td>327</td>
        </tr>
        <tr>
            <td>Service Tech III</td>
            <td>319</td>
        </tr>
        <tr>
            <td>Service Tech II</td>
            <td>315</td>
        </tr>
        <tr>
            <td>Service Tech</td>
            <td>315</td>
        </tr>
        <tr>
            <td>Service Manager</td>
            <td>319</td>
        </tr>
        <tr>
            <td>Service Coordinator</td>
            <td>313</td>
        </tr>
        <tr>
            <td>Senior Trainer</td>
            <td>176</td>
        </tr>
      <tr>
      <th>Job Title</th>
      <th>Count</th>
    </tr>
    <tr>
      <td>Senior Sales Associate</td>
      <td>14</td>
    </tr>
    <tr>
      <td>Senior Recruiter</td>
      <td>193</td>
    </tr>
    <tr>
      <td>Senior Quality Engineer</td>
      <td>148</td>
    </tr>
    <tr>
      <td>Senior Financial Analyst</td>
      <td>57</td>
    </tr>
    <tr>
      <td>Senior Editor</td>
      <td>138</td>
    </tr>
    <tr>
      <td>Senior Developer</td>
      <td>346</td>
    </tr>
    <tr>
      <td>Senior Cost Accountant</td>
      <td>301</td>
    </tr>
    <tr>
      <td>Senior Attorney</td>
      <td>37</td>
    </tr>
    <tr>
      <td>Sales Representative</td>
      <td>5</td>
    </tr>
    <tr>
      <td>Sales Associate</td>
      <td>6</td>
    </tr>
    <tr>
      <td>Research Associate</td>
      <td>201</td>
    </tr>
    <tr>
      <td>Research Assistant IV</td>
      <td>6</td>
    </tr>
    <tr>
      <td>Research Assistant III</td>
      <td>18</td>
    </tr>
    <tr>
      <td>Research Assistant II</td>
      <td>718</td>
    </tr>
    <tr>
      <td>Research Assistant I</td>
      <td>507</td>
    </tr>
    <tr>
      <td>Research Assistant</td>
      <td>39</td>
    </tr>
    <tr>
      <td>Relationship Manager</td>
      <td>201</td>
    </tr>
    <tr>
      <td>Recruiting Manager</td>
      <td>22</td>
    </tr>
    <tr>
      <td>Recruiter</td>
      <td>222</td>
    </tr>
    <tr>
      <td>Quality Engineer</td>
      <td>61</td>
    </tr>
    <tr>
      <td>Quality Control Specialist</td>
      <td>131</td>
    </tr>
    <tr>
      <td>Project Manager</td>
      <td>329</td>
    </tr>
    <tr>
      <td>Programmer IV</td>
      <td>61</td>
    </tr>
    <tr>
      <td>Programmer III</td>
      <td>78</td>
    </tr>
    <tr>
      <td>Programmer II</td>
      <td>77</td>
    </tr>
    <tr>
      <td>Programmer I</td>
      <td>84</td>
    </tr>
    <tr>
      <td>Programmer Analyst IV</td>
      <td>72</td>
    </tr>
    <tr>
      <td>Programmer Analyst III</td>
      <td>78</td>
    </tr>
    <tr>
      <td>Programmer Analyst II</td>
      <td>89</td>
    </tr>
    <tr>
      <td>Programmer Analyst I</td>
      <td>86</td>
    </tr>
    <tr>
      <td>Product Engineer</td>
      <td>56</td>
    </tr>
    <tr>
      <td>Pre-Sales Consultant</td>
      <td>209</td>
    </tr>
    <tr>
      <td>Payment Adjustment Coordinator</td>
      <td>23</td>
    </tr>
    <tr>
      <td>Paralegal</td>
      <td>63</td>
    </tr>
    <tr>
      <td>Operator</td>
      <td>210</td>
    </tr>
    <tr>
      <td>Office Assistant IV</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Office Assistant II</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Office Assistant I</td>
      <td>7</td>
    </tr>
    <tr>
      <td>Media Manager II</td>
      <td>47</td>
    </tr>
    <tr>
      <td>Media Manager I</td>
      <td>124</td>
    </tr>
    <tr>
      <td>Mechanical Systems Engineer</td>
      <td>28</td>
    </tr>
    <tr>
      <td>Marketing Manager</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Marketing Assistant</td>
      <td>8</td>
    </tr>
    <tr>
      <td>Librarian</td>
      <td>27</td>
    </tr>
    <tr>
      <td>Legal Assistant</td>
      <td>19</td>
    </tr>
    <tr>
      <td>Senior Sales Associate</td>
      <td>14</td>
    </tr>
    <tr>
      <td>Senior Recruiter</td>
      <td>193</td>
    </tr>
    <tr>
      <td>Senior Quality Engineer</td>
      <td>148</td>
    </tr>
    <tr>
      <td>Senior Financial Analyst</td>
      <td>57</td>
    </tr>
    <tr>
      <td>Senior Editor</td>
      <td>138</td>
    </tr>
    <tr>
      <td>Senior Developer</td>
      <td>346</td>
    </tr>
    <tr>
      <td>Senior Cost Accountant</td>
      <td>301</td>
    </tr>
    <tr>
      <td>Senior Attorney</td>
      <td>37</td>
    </tr>
    <tr>
      <td>Sales Representative</td>
      <td>5</td>
    </tr>
    <tr>
      <td>Sales Associate</td>
      <td>6</td>
    </tr>
    <tr>
      <td>Research Associate</td>
      <td>201</td>
    </tr>
    <tr>
      <td>Research Assistant IV</td>
      <td>6</td>
    </tr>
    <tr>
      <td>Research Assistant III</td>
      <td>18</td>
    </tr>
    <tr>
      <td>Research Assistant II</td>
      <td>718</td>
    </tr>
    <tr>
      <td>Research Assistant I</td>
      <td>507</td>
    </tr>
    <tr>
      <td>Research Assistant</td>
      <td>39</td>
    </tr>
    <tr>
      <td>Relationship Manager</td>
      <td>201</td>
    </tr>
    <tr>
      <td>Recruiting Manager</td>
      <td>22</td>
    </tr>
    <tr>
      <td>Recruiter</td>
      <td>222</td>
    </tr>
    <tr>
      <td>Quality Engineer</td>
      <td>61</td>
    </tr>
    <tr>
      <td>Quality Control Specialist</td>
      <td>131</td>
    </tr>
    <tr>
      <td>Project Manager</td>
      <td>329</td>
    </tr>
    <tr>
      <td>Programmer IV</td>
      <td>61</td>
    </tr>
    <tr>
      <td>Programmer III</td>
      <td>78</td>
    </tr>
    <tr>
      <td>Programmer II</td>
      <td>77</td>
    </tr>
    <tr>
      <td>Programmer I</td>
      <td>84</td>
    </tr>
    <tr>
      <td>Programmer Analyst IV</td>
      <td>72</td>
    </tr>
    <tr>
      <td>Programmer Analyst III</td>
      <td>78</td>
    </tr>
    <tr>
      <td>Programmer Analyst II</td>
      <td>89</td>
    </tr>
    <tr>
      <td>Programmer Analyst I</td>
      <td>86</td>
    </tr>
    <tr>
      <td>Product Engineer</td>
      <td>56</td>
    </tr>
    <tr>
      <td>Pre-Sales Consultant</td>
      <td>209</td>
    </tr>
    <tr>
      <td>Payment Adjustment Coordinator</td>
      <td>23</td>
    </tr>
    <tr>
      <td>Paralegal</td>
      <td>63</td>
    </tr>
    <tr>
      <td>Operator</td>
      <td>210</td>
    </tr>
    <tr>
      <td>Office Assistant IV</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Office Assistant II</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Office Assistant I</td>
      <td>7</td>
    </tr>
    <tr>
      <td>Media Manager II</td>
      <td>47</td>
    </tr>
    <tr>
      <td>Media Manager I</td>
      <td>124</td>
    </tr>
    <tr>
      <td>Mechanical Systems Engineer</td>
      <td>28</td>
    </tr>
    <tr>
      <td>Marketing Manager</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Marketing Assistant</td>
      <td>8</td>
    </tr>
    <tr>
      <td>Librarian</td>
      <td>27</td>
    </tr>
    <tr>
      <td>Legal Assistant</td>
      <td>19</td>
    </tr> 

<h3> 8. Which department has the highest turnover rate? </h3>

        SELECT department, count(*) as total_count,
          SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as terminated_count,
          SUM(termdate = '-') AS active_count,
          (SUM(termdate != '-' AND termdate <= CURRENT_DATE())/count(*)) as termination_rate
        FROM HR.human GROUP BY department ORDER BY termination_rate ASC;

<h3> 9. What is the distribution of employees across locations by state? </h3>

        SELECT location_state, COUNT(*) AS count FROM HR.human GROUP BY location_state ORDER BY count DESC;

<h3> 10. How has the company's employee count changed over time based on hire and term dates? </h3>

        SELECT YEAR(hire_date) AS year,
        Count(*) as hires,
        SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as terminated_count,
        COUNT(*) - SUM(termdate != '-' AND termdate <= CURRENT_DATE()) as net_change,
        ROUND(((count(*)- SUM(termdate != '-' AND termdate <= CURRENT_DATE()))/ count(*) * 100),2) AS net_change_percent
        FROM HR.human GROUP BY YEAR(hire_date) ORDER BY YEAR(hire_date) ASC;

<h3> 11. What is the tenure distribution for each department? </h3>

        SELECT department, ROUND(AVG(datediff(CURRENT_DATE(),termdate)/365),0) AS AVG_tenure FROM HR.human WHERE termdate != '-' AND termdate <= CURRENT_DATE() GROUP BY department;





