--- 1. Find the Total Number of Students in Each Department 
SELECT
    d.department_name,
	count(s.student_id) as total_students
FROM
   Departments d 
JOIN 
   Students s on d.department_id = s.department_id
GROUP BY
d.department_name
ORDER BY
total_students desc

--- 2. List All Courses Taught by a Specific Professor
SELECT
    c.course_name,
    c.course_id,
    CONCAT(p.first_name, ' ', p.last_name) AS professor_name
FROM
    Courses c
JOIN
    Professors p ON c.professor_id = p.professor_id
WHERE
    p.first_name = 'Alice' AND p.last_name = 'Smith';

--- 3. Find the Average Grade of Students in Each Course
SELECT 
    c.course_name,
    AVG(
        CASE 
            WHEN e.grade = 'A' THEN 4.0
            WHEN e.grade = 'B' THEN 3.0
            WHEN e.grade = 'C' THEN 2.0
            WHEN e.grade = 'D' THEN 1.0
            WHEN e.grade = 'F' THEN 0.0
            ELSE NULL  -- Handle any unexpected values
        END
    ) AS avg_grade
FROM
    Enrollments e
JOIN
    Students s ON e.student_id = s.student_id
JOIN
    Courses c ON c.course_id = e.course_id
GROUP BY
    c.course_name, c.course_id;

--- 4. List All Students Who Have Not Enrolled in Any Courses
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    s.phone,
    s.date_of_birth,
    s.enrollment_date
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.student_id IS NULL;

--- 5. Find the Number of Courses Offered by Each Department 
SELECT
   d.department_name,
   count(c.course_id) as no_courses
FROM 
   Departments d
LEFT JOIN 
  Courses c ON d.department_id = c.department_id
GROUP BY 
  d.department_name
ORDER BY
  no_courses desc

--- 6.List All Students Who Have Taken a Specific Course (e.g., 'Database Systems') 
SELECT 
   CONCAT(s.first_name,' ',s.last_name) as students_name,
   c.course_name
FROM
   Students s
JOIN
  Enrollments e ON s.student_id = e.student_id
JOIN
  Courses c ON c.course_id = e.course_id
WHERE
c.course_name = 'Database Systems'

--- 7.  Find the Most Popular Course Based on Enrollment Numbers 
SELECT 
  c.course_name,
  count(e.enrollment_id) as enrollment_count
FROM
 Courses c 
JOIN 
 Enrollments e ON c.course_id = e.course_id
 GROUP BY
 c.course_name
 ORDER BY
 enrollment_count desc

--- 8.  Find the Average Number of Credits Per Student in a Department 

--- 9. List All Professors Who Teach in More Than One Department 
SELECT
    p.professor_id,
    CONCAT(p.first_name,' ',p.last_name) AS professor_name
FROM
    Professors AS p
JOIN
    Courses AS c ON p.professor_id = c.professor_id
GROUP BY
    p.professor_id,
    CONCAT(p.first_name,' ',p.last_name)
HAVING
    COUNT(DISTINCT c.department_id) > 1;

--- 10. Get the Highest and Lowest Grade in a Specific Course (e.g., 'Operating Systems') 
SELECT
   max(e.grade) as max_grade,
   min(e.grade) as min_grade,
   c.course_name
FROM
  Courses c 
JOIN 
  Enrollments e ON c.course_id = e.course_id
WHERE 
  c.course_name = 'Operaring Systems'
GROUP BY
c.course_name

  

