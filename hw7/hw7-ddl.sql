--hw7-ddl.sql

# DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
# The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

DROP TABLE IF EXISTS 23FA_users_zcmcdonough.peopleroles;
DROP TABLE IF EXISTS 23FA_users_zcmcdonough.peopleskills;
DROP TABLE IF EXISTS 23FA_users_zcmcdonough.people;
DROP TABLE IF EXISTS 23FA_users_zcmcdonough.roles;
DROP TABLE IF EXISTS 23FA_users_zcmcdonough.skills;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE 23FA_users_zcmcdonough.skills (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(4096),
    tag VARCHAR(255),
    url VARCHAR(255),
    time_commitment VARCHAR(255)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!
-- Populate the skills table with eight skills
INSERT INTO 23FA_users_zcmcdonough.skills (id, name, description, tag, url, time_commitment) VALUES
(1, 'Web Development', 'Skill in creating and maintaining websites', 'Skill 1', 'http://webdev.com', '30 hours'),
(2, 'Graphic Design', 'Skill in visual content creation', 'Skill 2', 'http://graphicdesign.com', '25 hours'),
(3, 'Project Management', 'Skill in managing projects effectively', 'Skill 3', 'http://projectmanagement.com', '40 hours'),
(4, 'Data Analysis', 'Skill in analyzing and interpreting data', 'Skill 4', 'http://dataanalysis.com', '35 hours'),
(5, 'Machine Learning', 'Skill in developing machine learning models', 'Skill 5', 'http://machinelearning.com', '45 hours'),
(6, 'Digital Marketing', 'Skill in online marketing strategies', 'Skill 6', 'http://digitalmarketing.com', '20 hours'),
(7, 'Cybersecurity', 'Skill in protecting systems from cyber threats', 'Skill 7', 'http://cybersecurity.com', '50 hours'),
(8, 'Mobile App Development', 'Skill in developing mobile applications', 'Skill 8', 'http://mobileappdev.com', '60 hours');



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE 23FA_users_zcmcdonough.people (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.


INSERT INTO 23FA_users_zcmcdonough.people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'Alice', 'Person 1', 'alice@email.com', 'http://linkedin.com/in/alice', 'http://headshot1.com', 'alicehandle', 'Bio of Alice', '2023-01-01'),
(2, 'Bob', 'Person 2', 'bob@email.com', 'http://linkedin.com/in/bob', 'http://headshot2.com', 'bobhandle', 'Bio of Bob', '2023-01-02'),
(3, 'Charlie', 'Person 3', 'charlie@email.com', 'http://linkedin.com/in/charlie', 'http://headshot3.com', 'charliehandle', 'Bio of Charlie', '2023-01-03'),
(4, 'Diana', 'Person 4', 'diana@email.com', 'http://linkedin.com/in/diana', 'http://headshot4.com', 'dianahandle', 'Bio of Diana', '2023-01-04'),
(5, 'Ethan', 'Person 5', 'ethan@email.com', 'http://linkedin.com/in/ethan', 'http://headshot5.com', 'ethanhandle', 'Bio of Ethan', '2023-01-05'),
(6, 'Fiona', 'Person 6', 'fiona@email.com', 'http://linkedin.com/in/fiona', 'http://headshot6.com', 'fionahandle', 'Bio of Fiona', '2023-01-06'),
(7, 'George', 'Person 7', 'george@email.com', 'http://linkedin.com/in/george', 'http://headshot7.com', 'georgehandle', 'Bio of George', '2023-01-07'),
(8, 'Hannah', 'Person 8', 'hannah@email.com', 'http://linkedin.com/in/hannah', 'http://headshot8.com', 'hannahhandle', 'Bio of Hannah', '2023-01-08'),
(9, 'Ian', 'Person 9', 'ian@email.com', 'http://linkedin.com/in/ian', 'http://headshot9.com', 'ianhandle', 'Bio of Ian', '2023-01-09'),
(10, 'Julia', 'Person 10', 'julia@email.com', 'http://linkedin.com/in/julia', 'http://headshot10.com', 'juliahandle', 'Bio of Julia', '2023-01-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE 23FA_users_zcmcdonough.peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.


INSERT INTO 23FA_users_zcmcdonough.peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-02-01'), -- Person 1 has skill 1
(3, 1, '2023-02-15'), -- Person 1 has skill 3
(6, 1, '2023-03-01'), -- Person 1 has skill 6
(3, 2, '2023-02-20'), -- Person 2 has skill 3
(4, 2, '2023-03-05'), -- Person 2 has skill 4
(5, 2, '2023-03-10'), -- Person 2 has skill 5
(1, 3, '2023-02-25'), -- Person 3 has skill 1
(5, 3, '2023-03-15'), -- Person 3 has skill 5
(3, 5, '2023-04-01'), -- Person 5 has skill 3
(6, 5, '2023-04-10'), -- Person 5 has skill 6
(2, 6, '2023-04-15'), -- Person 6 has skill 2
(3, 6, '2023-04-20'), -- Person 6 has skill 3
(4, 6, '2023-05-01'), -- Person 6 has skill 4
(3, 7, '2023-05-10'), -- Person 7 has skill 3
(5, 7, '2023-05-15'), -- Person 7 has skill 5
(6, 7, '2023-05-20'), -- Person 7 has skill 6
(1, 8, '2023-06-01'), -- Person 8 has skill 1
(3, 8, '2023-06-05'), -- Person 8 has skill 3
(5, 8, '2023-06-10'), -- Person 8 has skill 5
(6, 8, '2023-06-15'), -- Person 8 has skill 6
(2, 9, '2023-06-20'), -- Person 9 has skill 2
(5, 9, '2023-07-01'), -- Person 9 has skill 5
(6, 9, '2023-07-05'), -- Person 9 has skill 6
(1, 10, '2023-07-10'), -- Person 10 has skill 1
(4, 10, '2023-07-15'), -- Person 10 has skill 4
(5, 10, '2023-07-20'); -- Person 10 has skill 5

 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE 23FA_users_zcmcdonough.roles (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sort_priority INT
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO 23FA_users_zcmcdonough.roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment


CREATE TABLE 23FA_users_zcmcdonough.peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_role_acquired DATE NOT NULL,
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);




# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

-- Populate the peopleroles table
INSERT INTO 23FA_users_zcmcdonough.peopleroles (people_id, role_id, date_role_acquired) VALUES
(1, 2, '2023-01-01'), -- Person 1 is a Developer
(2, 5, '2023-01-05'), -- Person 2 is a Boss
(2, 6, '2023-01-10'), -- Person 2 is also a Mentor
(3, 2, '2023-01-15'), -- Person 3 is a Developer
(3, 4, '2023-01-20'), -- Person 3 is also a Team Lead
(4, 3, '2023-01-25'), -- Person 4 is a Recruit
(5, 3, '2023-02-01'), -- Person 5 is a Recruit
(6, 2, '2023-02-05'), -- Person 6 is a Developer
(6, 1, '2023-02-10'), -- Person 6 is also a Designer
(7, 1, '2023-02-15'), -- Person 7 is a Designer
(8, 1, '2023-02-20'), -- Person 8 is a Designer
(8, 4, '2023-02-25'), -- Person 8 is also a Team Lead
(9, 2, '2023-03-01'), -- Person 9 is a Developer
(10, 2, '2023-03-05'), -- Person 10 is a Developer
(10, 1, '2023-03-10'); -- Person 10 is also a Designer
