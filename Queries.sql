-- Q1
SELECT * FROM babysitter
WHERE hourly_rate >= 20 AND min_age >=3;

-- Q2
SELECT b.babysitter_id, b.first_name, b.last_name
FROM babysitter b
WHERE NOT EXISTS (
	SELECT * FROM meeting m
    WHERE b.babysitter_id = m.babysitter_id 
    AND NOT (m.end_time <= '2024-01-01 18:00:00' OR m.start_time >= '2024-01-01 20:00:00')
);

-- Q3
SELECT p.parent_id, p.first_name, p.last_name
FROM parent p
JOIN child c ON p.parent_id = c.parent_id
GROUP BY p.parent_id
HAVING MAX(c.age) - MIN(c.age) >=5;

-- Q4
SELECT b.babysitter_id, b.first_name, b.last_name
FROM babysitter b 
WHERE NOT EXISTS (
    SELECT * FROM review r
    WHERE r.babysitter_id = b.babysitter_id AND r.ratting < 5
);

-- Q5
SELECT b.babysitter_id, b.first_name, b.last_name, COUNT(m.meeting_id) AS total_meetings 
FROM babysitter b
JOIN meeting m 	ON b.babysitter_id = m.babysitter_id
WHERE m.city = 'raanana'
GROUP BY b.babysitter_id
ORDER BY total_meetings DESC
LIMIT 1;

-- Q6
SELECT b.babysitter_id, b.first_name, b.last_name, COUNT(DISTINCT m.city) AS cities_worked
FROM babysitter b
JOIN meeting m ON b.babysitter_id = m.babysitter_id 
GROUP BY b.babysitter_id
HAVING cities_worked  > 1;

-- Q7
SELECT b.babysitter_id, b.first_name, b.last_name, b.hourly_rate, AVG(r.ratting) AS average_rating
FROM babysitter b
JOIN review r ON b.babysitter_id = r.babysitter_id
GROUP BY b.babysitter_id
HAVING average_rating > 6
ORDER BY b.hourly_rate DESC;

-- Q8
delimiter $$
create procedure addpay (
   in payment_id int,
   in meeting_id int,
   in parent_id int,
   in babysitter_id int,
   in payment_method varchar(20),
   in payment_date datetime,
   in status varchar(20),
   in discount int,
   in additional_payments int
)
begin 
    insert into payment (payment_id, meeting_id, parent_id, babysitter_id, payment_method, payment_date, status, discount, additional_payments)
    values (payment_id, meeting_id, parent_id, babysitter_id, payment_method, payment_date , status, discount, additional_payments);
end $$

CALL addpay(22, 2, 15, 'cash', '2023-10-10', 'paid', 0, 20);


-- Q9
SELECT babysitter_id, AVG(ratting) AS average_rating
FROM review
GROUP BY babysitter_id 
ORDER BY average_rating DESC
LIMIT 5;

-- Q10meeting
SELECT payment_id, meeting_id, payment_method, status, Abs(additional_payments - discount ) AS total_discount
FROM payment
WHERE parent_id = 2;

-- Q11
SELECT first_name, last_name, age, favorit_activity
FROM child;

 -- Q12
 SELECT first_name, last_name, years_of_experience
 FROM babysitter 
 WHERE years_of_experience > 5;
 
 -- Q13
 SELECT * FROM child 
 WHERE age BETWEEN 5 AND 10;
 
 -- Q14
 CREATE TABLE availability (
	availability_id INT PRIMARY KEY,
    babysitter_id INT,
    start_time DATETIME,
    end_time DATETIME, 
    FOREIGN KEY (babysitter_id) REFERENCES babysitter(babysitter_id)
);

-- Q15
CREATE VIEW BabysittersWithMostMeetings AS
SELECT babysitter_id, COUNT(meeting_id) AS total_meetings
FROM meeting
GROUP BY babysitter_id
ORDER BY total_meetings DESC 
LIMIT 1;

-- Q16
CREATE VIEW summery_meeting AS
SELECT m.meeting_id, m.parent_id, m.babysitter_id, r.ratting, r.comments
FROM  meeting m,  review r
where m.meeting_id = r.meeting_id;

select * from summery_meeting where meeting_id = 100;