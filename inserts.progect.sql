-- הוספת מטפלות
INSERT INTO babysitter VALUES
(90, 'Noa', 'Cohen', 'noa@gmail.com', 'f', 523775555, 'Hasharin 1 Tel Aviv', '1998-11-11', 70, 3, 'Tel Aviv', 153577, 10),
(12, 'Matan', 'Sayegh', 'matan@gmail.com', 'm', 502600249, 'Bet El 7 Tel Aviv', '1996-03-23', 100, 6, 'Tel Aviv', 867365, 8),
(13, 'Asaf', 'Lots', 'lots@gmail.com', 'm', 526784483, 'Hayarkon 102 Kfar Saba', '2000-01-01', 50, 2, 'Center', 132345, 5);

INSERT INTO babysitter (babysitter_id, first_name, last_name, email, gender, phone, address, date_of_birth, hourly_rate, min_age, working_range, bank_acount_num, years_of_experience)
VALUES (15, 'Example', 'Babysitter', 'example@email.com', 'f', 1234567890, '123 Example St', '1990-01-01', 25, 3, 'Example City', 123456, 5);

UPDATE babysitter
SET first_name = 'Maya', last_name = 'Gefen', email = 'gefen@email.com', gender = 'f', phone = 1234567890, address = '123 Bialik', date_of_birth = '1990-01-01', hourly_rate = 25, min_age = 3, working_range = 'Herzylia', bank_acount_num = 123456, years_of_experience = 5
WHERE babysitter_id = 15;

-- הוספת הורים
INSERT INTO parent VALUES
(1, 'Bar', 'Cohen', 'f', 'bar@gmail.com', 523775555, 'Romema 1 Zfat', '523647589', 'single', 'cash'),
(2, 'Dean', 'Dani', 'm', 'dd@walla.com', 548900001, 'Habanim 12 Raanana', '508893844', 'married', 'cash');

-- הוספת ילדים
INSERT INTO child VALUES
(1, 1, 'Shlomo', 'Cohen', 4, 'm', 'Romema 1 Zfat', NULL, 'Football', NULL),
(2, 2, 'Ziv', 'Dani', 2, 'f', 'Habanim 12 Raanana', NULL, 'Dolls', NULL),
(3, 2, 'Reut', 'Dani', 9, 'f', 'Habanim 12 Raanana', NULL, 'Dolls', NULL);

-- הוספת פגישות
INSERT INTO meeting VALUES
(100, 1, 90, '2023-12-01 18:00:00', '2023-12-01 22:00:00', 'Zfat', 'Romema', 1),
(101, 2, 13, '2024-01-01 18:30:00', '2024-01-01 22:30:00', 'Raanana', 'Habanim', 12),
(102, 2, 12, '2024-01-01 19:00:00', '2024-01-01 23:00:00', 'Raanana', 'Habanim', 12);

-- הוספת ביקורות
INSERT INTO review VALUES
(1, 1, 90, 100, 8, 'Great service'),
(2, 2, 13, 101, 9, 'Very good'),
(3, 2, 12, 102, 10, 'Excellent');

-- הוספת תשלומים
INSERT INTO payment VALUES
(10, 1, 90, 'cash', '2023-12-01', 'paid', 0, 20),
(11, 2, 13, 'card', '2024-01-01', 'paid', 5, 25);

-- הוספת טבלת availability (שאילתה Q14)
CREATE TABLE availability (
    availability_id INT PRIMARY KEY,
    babysitter_id INT,
    start_time DATETIME,
    end_time DATETIME, 
    FOREIGN KEY (babysitter_id) REFERENCES babysitter(babysitter_id)
);

-- הגדרת נוף עבור שאילתות Q15 ו-Q16
CREATE VIEW BabysittersWithMostMeetings AS
SELECT babysitter_id, COUNT(meeting_id) AS total_meetings
FROM meeting
GROUP BY babysitter_id
ORDER BY total_meetings DESC 
LIMIT 1;

CREATE VIEW summery_meeting AS
SELECT meeting_id, parent_id, babysitter_id, ratting, comments
FROM meeting m JOIN review r ON m.m