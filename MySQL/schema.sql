CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(20),
branch VARCHAR(50),
semester INT
);

CREATE TABLE documents(
document_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
document_name VARCHAR(100),
file_path VARCHAR(255),
upload_date DATE,
status VARCHAR(20)
);

CREATE TABLE projects(
project_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
title VARCHAR(255),
description TEXT
);

CREATE TABLE certificates(
certificate_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
title VARCHAR(255),
issuer VARCHAR(255)
);

CREATE TABLE achievements(
achievement_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
title VARCHAR(255),
description TEXT
);

CREATE TABLE university_requirements(
requirement_id INT AUTO_INCREMENT PRIMARY KEY,
document_name VARCHAR(100)
);