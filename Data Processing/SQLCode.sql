SELECT * FROM user_profiles;

SELECT
  UserID,
  TRIM(REPLACE(Name, ' ', '')) AS Name,
  Surname,
  REPLACE(Email, ' ', '') AS Email,
  Gender,
  Race,
  Age,
  Province,
  replace(`Social Media Handle`,' ','') AS Socials
FROM (
  SELECT 
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[0] AS UserID,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[1] AS Name,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[2] AS Surname,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[3] AS Email,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[4] AS Gender,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[5] AS Race,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[6] AS Age,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[7] AS Province,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[8] AS `Social Media Handle`
  FROM `workspace`.`default`.`user_profiles`
);

SELECT
  split(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[0] AS UserID,
  split(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[1] AS Channel2,
  split(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[2] AS RecordDate2,
  split(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[3] AS Duration2,
  split(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[4] AS Userid
FROM `workspace`.`default`.`viewership`;

--Joined tables

SELECT 
  up.UserID,
  up.Name,
  up.Surname,
  up.Email,
  up.Gender,
  up.Race,
  up.Age,
  -- Age group categorization
  CASE 
    WHEN up.Age < 13 THEN 'Kids'
    WHEN up.Age BETWEEN 13 AND 17 THEN 'Teens'
    WHEN up.Age BETWEEN 18 AND 35 THEN 'Young Adults'
    WHEN up.Age BETWEEN 36 AND 50 THEN 'Adults'
    ELSE 'Seniors'
  END AS AgeGroup,
  up.Province,
  up.Socials,
  v.Channel2,
  to_timestamp(v.RecordDate2, 'yyyy/MM/dd HH:mm') AS RecordDate2,
  -- Time bucket categorization
  CASE 
    WHEN HOUR(to_timestamp(v.RecordDate2, 'yyyy/MM/dd HH:mm')) BETWEEN 0 AND 11 THEN 'Morning'
    WHEN HOUR(to_timestamp(v.RecordDate2, 'yyyy/MM/dd HH:mm')) BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN HOUR(to_timestamp(v.RecordDate2, 'yyyy/MM/dd HH:mm')) BETWEEN 18 AND 22 THEN 'Evening'
    ELSE 'Night'
  END AS TimeBucket,
 try_cast(
    split(v.Duration2, ':')[0] * 3600 +
    split(v.Duration2, ':')[1] * 60 +
    split(v.Duration2, ':')[2] AS INT
  ) AS Duration
FROM (
  SELECT 
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[0] AS UserID,
    TRIM(REPLACE(SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[1], ' ', '')) AS Name,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[2] AS Surname,
    REPLACE(SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[3], ' ', '') AS Email,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[4] AS Gender,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[5] AS Race,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[6] AS Age,
    SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[7] AS Province,
    REPLACE(SPLIT(`UserID;Name;Surname;Email;Gender;Race;Age;Province;Social Media Handle`, ';')[8], ' ', '') AS Socials
  FROM `workspace`.`default`.`user_profiles`
) up
JOIN (
  SELECT
    SPLIT(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[0] AS UserID,
    SPLIT(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[1] AS Channel2,
    SPLIT(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[2] AS RecordDate2,
    SPLIT(`UserID;Channel2;RecordDate2;Duration 2;userid;;`, ';')[3] AS Duration2
  FROM `workspace`.`default`.`viewership`
) v
ON up.UserID = v.UserID;




