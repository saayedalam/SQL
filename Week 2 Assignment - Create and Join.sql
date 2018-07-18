/*
Saayed Alam
Data Science Bridge Workshop
Week 2 Assignment
*/ 

## In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping track of a database that contain the best “how-to” videos on MySQL.
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviewers;

#1 Create one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL.
CREATE TABLE videos 
(video_id INT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
length NUMERIC NOT NULL, 
url VARCHAR(150) NOT NULL);

# Populate the table with at least three related videos from YouTube or other publicly available resources.
INSERT INTO videos 
(video_id, title, length, url)
VALUES
(1, '13 Tips on How to Survive Wild Animal Attacks', 615, 'https://www.youtube.com/watch?v=kkFFq11j6dQ'),
(2, 'Avatar: The Last Airbender — How To Write A Compelling Backstory', 536, 'https://www.youtube.com/watch?v=vOJmhq-ve2Y'),
(3, 'Yerba Mate | Thirsty For ...', 536, 'https://www.youtube.com/watch?v=-BW1-pE4XaE'),
(4, 'How To Open Coconuts Without Any Tools', 265, 'https://www.youtube.com/watch?v=T9bXoOa1qTg'),
(5, 'How to use Kaggle ?', 553, 'https://www.youtube.com/watch?v=Gp_qv317Gew');

SELECT *
FROM videos;

#2 Create a second table that provides at least two user reviews for each of at least two of the videos. These should be imaginary reviews that include columns for the user’s name (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”). There should be a column that links back to the ID column in the table of videos.
CREATE TABLE reviewers
(reviewer_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
rating INT CHECK(rating BETWEEN 0 AND 5),
review VARCHAR(150) NOT NULL,
video_id INT NOT NULL REFERENCES videos);

INSERT INTO reviewers
(reviewer_id, name, rating, review, video_id)
VALUES
(1, 'Sim', 4, 'dont panic', 5),
(2, 'Vishal Trehan', 3, "The narrator sounds like my grandfather", 1),
(3, 'Vicente Ortega Rubilar', 5, "You bring HONOR to the memory of Avatar. Well done Mr just write", 2),
(4, 'Felicity Swan', 4, "leaves from vines, falling so slow... cries", 2),
(5, 'Slaiman Fadel', 5, "One of Luis Suarez and Lionel Messi photo sent me here I guess they like mate. xD", 3),
(6, 'ch5412', 3, "anyone else here from mozart in the jungle?", 3),
(7, 'Xavier Smith', 5, "false: a rock is a tool.", 4),
(8, 'CodysLab', 2, "Geologist approved!", 4),
(9, 'Apple Safari', 1, "helpful!", 1),
(10, 'Shahul Es', 5, "am not getting no output image in output section when i click commit and run. what should i do?", 5);

SELECT *
FROM reviewers;

#3 Write a JOIN statement that shows information from both tables.
SELECT
V.video_id AS 'Video ID',
V.title AS 'Title',
V.length AS 'Length',
V.url AS 'URL',
R.reviewer_id AS 'Reviewer ID',
R.name AS 'Name',
R.rating AS 'Rating',
R.review AS 'Review' 
FROM videos AS V
INNER JOIN reviewers AS R
ON V.video_id = R.video_id
ORDER BY V.video_id;
