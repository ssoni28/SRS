drop database if exists SRS;
create database SRS;
use SRS;

create table Building
(
	id int primary key auto_increment,
	name varchar(255),
	address varchar(255)
	
);

create table Location
(
	id int primary key auto_increment,
	building int not null,
	foreign key(building) references Building(id)
		on update cascade on delete cascade,
	room_no varchar(250) not null
);

create table Department
(
	id int primary key auto_increment,
	name varchar(255) not null,
	phoneNumber varchar(10),
	location int,
	foreign key (location) references Location(id)
		on update cascade on delete no action
);

Create table Advisor
(
	id int primary key auto_increment,
 	fName varchar(255) not null,
	lName varchar(255) not null,
	email varchar(255) unique,
	phone varchar(10),
	location integer,
	foreign key (location) references Location(id)
		on update cascade on delete set null,
	username varchar(255)
);

create table Student 
	(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
	schoolID char(8) not null,
    email varchar(255) unique,
	major integer,
	foreign key (major) references Department(id)
		on update cascade on delete set null,
	address1 varchar(255) not null,
	address2 varchar(255),
	address3 varchar(255),
	city varchar(255) not null,
	state varchar(255) not null,
    postalCode varchar(10) not null,
	country varchar(255) not null,
	phoneNumber varchar(15),
	advisor int,
	foreign key (advisor) references Advisor(id)
		on update cascade on delete set null,
	yearOfGraduation integer,
	livesOncampus enum('No','Yes') not null,
    username varchar(255) unique
	);

create table Course
	(
	id int primary key auto_increment,
	courseNumber varchar(8) unique,
	title varchar(255),
	courseLevel varchar(255),
    description longtext,
	department int,
	foreign key (department) references Department(id) 
		on update cascade on delete no action
);

create table Instructor
(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
    email varchar(255) unique,
	department integer,
	officeLocation integer,
	foreign key (officeLocation) references Location(id)
		on update cascade on delete cascade,
	username varchar(255) unique
);

create table Section
	(
	id int primary key auto_increment,
	course int,
	location int,
	foreign key (location) references Location(id)
		on update cascade on delete set null,
	semester varchar(255),
	instructor int,
	foreign key (course) references Course(id) 
		on update cascade on delete no action
);

create table Registration 
	(
	student int,
	foreign key (student) references Student(id) 
		on update cascade on delete cascade,
	section int,
    foreign key (section) references Section(id)
		on update cascade on delete cascade,
	grade varchar(2),
 	time_stamp timestamp,
	primary key (student, section)
);

Create table OnCampusHousing
(
	id int primary key,
	student int,
	foreign key (student) references Student(id)
		on update cascade on delete no action,
	location int,
	foreign key (location) references Location(id)
		on update cascade on delete no action
);

-- create indexes for all primary keys and unique fields
create unique index BLD_IDX using hash on Building(id);
create unique index LOC_IDX using hash on Location(id);
create unique index DEPT_IDX using hash on Department(id);
create unique index ADV_IDX using hash on Advisor(id);
create unique index STDNT_IDX using hash on Student(id);
create unique index CRS_IDX using hash on Course(id);
create unique index INST_IDX using hash on Instructor(id);
create unique index SECT_IDX using hash on Section(id);
create unique index REG_IDX using btree on Registration(student,section);
create unique index OCH_IDX using hash on OnCampusHousing(id);
create unique index INST_UNAME_IDX using hash on Instructor(username);
create unique index ADV_UNAME_IDX using hash on Advisor(username);
create unique index STDNT_UNAM_IDX using hash on Student(username);

-- create indexes for common searches
create index BLDADR_IDX using hash on Building(address);
create index ANAME_IDX using hash on Advisor(lName);
create index SNAME_IDX using hash on Student(lName);
create index SMAJ_IDX using btree on Student(major);
create index SSID_IDX using hash on Student(schoolID);
create index SSTATE_IDX using btree on Student(state);
create index SGRAD_IDX using btree on Student(yearOfGraduation);
create index SADV_IDX using btree on Student(advisor);
create unique index CNUM_IDX using hash on Course(courseNumber);
create index CDEPT_IDX using btree on Course(department);
create index INAME_IDX using hash on Instructor(lName);
create index IDEPT_IDX using btree on Instructor(department);
create index SECCRS_IDX using btree on Section(course);
create index SECINS_IDX using btree on Section(instructor);
create index REGSEC_IDX using btree on Registration(section);

/* 
Create Views for (user:activity)
Student, Advisor, Registrar: view student data
*/

-- Clean up Accounts
drop user if exists 'registrar'@'localhost';
drop user if exists 'admin'@'localhost';
drop user if exists 'm.jones'@'localhost';
drop user if exists 'l.smith'@'localhost';
drop user if exists 'wilkerson.v'@'localhost';

-- create super users
create user 'registrar'@'localhost' identified by 'registrar';
create user 'admin'@'localhost' identified by 'admin';
-- create 1 student
create user 'wilkerson.v'@'localhost' identified by 'wilkerson';
-- create 1 instructor
create user 'l.smith'@'localhost' identified by 'smith';
-- create 1 advisor
create user 'm.jones'@'localhost' identified by 'jones';


-- create views
create view StudentInfo as
	select s.schoolID, s.fName as studentFirstName, s.lName as studentLastName, d.name as major, s.address1, s.address2, s.address3, 
		s.city, s.state, s.postalCode, s.country, s.phoneNumber, a.fName as advisorFirstName, a.lName as advisorLastName, 
        s.yearOfGraduation, s.livesOncampus
    from Student s, Department d, Advisor a
    where s.major = d.id
		and s.advisor = a.id;

create view StudentTranscript as
	select s.schoolID, s.fName as studentFirstName, s.lName as studentLastName, sec.semester, c.courseNumber, c.title, r.grade
    from Student s, Registration r, Section sec, Course c
    where s.id = r.student
		and r.section = sec.id
        and sec.course = c.id;
	-- note: Will need to call this through another SQL query where the schoolID is provided by the web page.
    -- The web page will need to provide the schoolID based on the logged in student, or by the schoolID provided
    -- by the admin, registrar, or advisor

create view Roster as
	select c.courseNumber, c.title, sec.semester, s.schoolID, s.fName as studentFirstName, s.lName as studentLastName, d.name as major, r.grade
    from Instructor i, Section sec, Course c, Registration r, Student s, Department d
    where i.id = sec.instructor
		and sec.id = r.section
        and sec.course = c.id
        and r.student = s.id
        and s.major = d.id
	order by c.courseNumber, s.lName, s.fName;

-- grant permissions
-- registrar: update on all tables
-- students: view on Student, Department, Advisor
-- students: upate on Registration
-- Student Info: students, advisors, admin, registrar: View on Student, Department, Advisor. 

-- build tables with information
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Library', '1 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Tower 1', '2 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Tower 2', '3 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Student Center', '4 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 1', '5 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 2', '6 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Classroom Building 3', '7 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 1', '8 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 2', '9 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dorm 3', '10 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Dining Hall', '11 Main Street');
INSERT INTO `SRS`.`Building` (`name`, `address`) VALUES ('Department Building', '12 Main Street');

INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (1,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (1,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (1,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (1,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (1,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (2,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (2,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (2,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (2,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (2,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (3,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (3,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (3,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (3,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (3,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (4,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (4,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (4,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (4,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (4,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (5,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (5,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (5,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (5,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (5,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (6,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (6,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (6,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (6,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (6,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (7,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (7,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (7,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (7,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (7,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (8,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (8,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (8,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (8,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (8,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (9,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (9,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (9,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (9,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (9,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (10,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (10,'1050');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (10,'1100');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (10,'1150');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (10,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (11,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'1000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'1200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'1300');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'2000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'2200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'2300');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'3000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'3200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'3300');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'4000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'4200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'4300');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'5000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'5200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'5300');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'6000');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'6200');
INSERT INTO `SRS`.`Location` (`building`, `room_no`) VALUES (12,'6300');

INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('1', 'Science', '6171234567', '52');
INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('2', 'Mathematics', '6172345678', '55');
INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('3', 'Physical Education', '6173456789', '58');
INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('4', 'Engineering', '6174567891', '61');
INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('5', 'Law', '6175678912', '64');
INSERT INTO `srs`.`department` (`id`, `name`, `phoneNumber`, `location`) VALUES ('6', 'English', '6176789123', '67');

INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('1', 'Lewis', 'Smith', 'l.smith@school.edu', 1, '53', 'l.smith');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('2', 'Russel', 'Peter', 'r.peter@school.edu', 1, '54', 'r.peter');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('3', 'John', 'Dave', 'j.dave@school.edu', 6, '68', 'j.dave');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('4', 'David', 'Kaeli', 'd.kaeli@school.edu', 4, '62', 'd.kaeli');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('5', 'Calvin', 'Martin', 'c.martin@school.edu', 4, '63', 'c.martin');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('6', 'Roy', 'Wilson', 'r.wilson@school.edu', 3, '59', 'r.wilson');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('7', 'Thomas', 'Edwards', 't.edwards@school.edu', 3, '60', 't.edwards');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('8', 'Freddy', 'Johnson', 'f.johnson@school.edu', 6, '69', 'f.johnson');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('9', 'White', 'Moore', 'w.moore@school.edu', 5, '65', 'w.moore');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('10', 'Ashley', 'Williams', 'a.williams@school.edu', 5, '66', 'a.williams');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('11', 'Rajat', 'Gupta', 'r.gupta@school.edu', 2, '56', 'r.gupta');
INSERT INTO `srs`.`instructor` (`id`, `fName`, `lName`, `email`, `department`, `officeLocation`, `username`) VALUES ('12', 'Chang', 'Lee', 'c.lee@school.edu', 2, '57', 'c.lee');

INSERT INTO `srs`.`Advisor` (`fName`, `lName`, `email`, `phone`, `location`, `username`) VALUES ('Mary', 'Jones', 'm.jones@school.edu', '6175551234', '6', 'm.jones');
INSERT INTO `srs`.`Advisor` (`fName`, `lName`, `email`, `phone`, `location`, `username`) VALUES ('Mark', 'Harrison', 'm.harrison@school.edu', '6175551235', '7', 'm.harrison');
INSERT INTO `srs`.`Advisor` (`fName`, `lName`, `email`, `phone`, `location`, `username`) VALUES ('Anna', 'George', 'a.george@school.edu', '6175551236', '8', 'a.george');
INSERT INTO `srs`.`Advisor` (`fName`, `lName`, `email`, `phone`, `location`, `username`) VALUES ('Sam', 'Smith', 's.smith@school.edu', '6175551237', '9', 's.smith');
INSERT INTO `srs`.`Advisor` (`fName`, `lName`, `email`, `phone`, `location`, `username`) VALUES ('Susan', 'Erickson', 's.erickson@school.edu', '6175551238', '10', 's.erickson');

INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Valerie', 'Wilkerson', '69190510', 'wilkerson.v', '1', '454 Spruce Avenue', 'Youngstown', 'OH', 'US', '6175551239', '1', '2016','44512');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Clyde', 'Hampton', '50174491', 'hampton.c', '2', '977 Eagle Road', 'Addison', 'IL', 'US', '6175551240', '2', '2016','60101');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Leo', 'Bennett', '40523365', 'bennett.l', '3', '98 Hawthorne Avenue', 'Merrick', 'NY', 'US', '6175551241', '3', '2016','11566');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Ralph', 'Holmes', '57863610', 'holmes.r', '4', '499 Central Avenue', 'Wayne', 'NJ', 'US', '6175551242', '4', '2016','07470');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Kay', 'Taylor', '94537002', 'taylor.k', '5', '200 Parker Street', 'Adrian', 'MI', 'US', '6175551243', '5', '2016','49221');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Hugh', 'Luna', '87983866', 'luna.h', '6', '85 Main Street East', 'Parlin', 'NJ', 'US', '6175551244', '1', '2017','08859');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Lynda', 'Mathis', '61064216', 'mathis.l', '1', '839 Creekside Drive', 'Downingtown', 'PA', 'US', '6175551245', '2', '2017','19335');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Shawna', 'Lucas', '30505475', 'lucas.s', '2', '203 Brandywine Drive', 'Lutherville Timonium', 'MD', 'US', '6175551246', '3', '2017','21093');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Jeffrey', 'Warren', '73554027', 'warren.j', '3', '326 Buckingham Drive', 'Metarie', 'LA', 'US', '6175551247', '4', '2017','70001');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Wallace', 'Silva', '83348935', 'silva.w', '4', '100 Colonial Drive', 'Hamden', 'CT', 'US', '6175551248', '5', '2017','06514');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Chester', 'Jennings', '58969182', 'jennings.c', '5', '856 Lexington Drive', 'Port Washington', 'NY', 'US', '6175551249', '1', '2018','11050');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Barbara', 'Tate', '46283953', 'tate.b', '6', '676 Cemetery Road', 'Camberidge', 'MA', 'US', '6175551250', '2', '2018','02138');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Caroline', 'Gutierrez', '90193483', 'gutierrez.c', '1', '263 Route 17 ', 'Warminster', 'PA', 'US', '6175551251', '3', '2018','18974');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Meredith', 'Garza', '53667109', 'garza.m', '2', '414 Monroe Street', 'Bozeman', 'MT', 'US', '6175551252', '4', '2018','59715');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Tony', 'Roberson', '60724800', 'roberson.t', '3', '369 Edgewood Road', 'Palm Harbor', 'FL', 'US', '6175551253', '5', '2018','34683');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Jamie', 'Warner', '34528690', 'warner.j', '4', '385 6th Avenue', 'Bellmore', 'NY', 'US', '6175551254', '1', '2019','11710');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Inez', 'Reeves', '84632404', 'reeves.i', '5', '867 Oxford Court', 'La Porte', 'IN', 'US', '6175551255', '2', '2019','46350');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Timothy', 'Hodges', '83608304', 'hodges.t', '6', '991 Laurel Drive', 'Glenview', 'IL', 'US', '6175551256', '3', '2019','60025');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Jan', 'Stevenson', '22399936', 'stevenson.j', '1', '964 Devon Court', 'Goldsboro', 'NC', 'US', '6175551257', '4', '2019','27530');
INSERT INTO `srs`.`Student` (`fName`, `lName`, `schoolID`, `username`, `major`, `address1`, `city`, `state`, `country`, `phoneNumber`, `advisor`, `yearOfGraduation`,`postalCode`) VALUES ('Forrest', 'Jenkins', '88192864', 'jenkins.f', '2', '531 Cleveland Street', 'Littleton', 'CO', 'US', '6175551258', '5', '2019','80123');

INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('1', 'PHYS1000', 'Physics 1', 'undergraduate', 'Designed to enable students to appreciate the role of physics in today\'s society and technology. Emphasis on the fundamental laws of nature on which all science is based.', '1');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('2', 'CHEM5000', 'Chemistry 1', 'graduate', 'This course will explore the ways modern chemists determine the composition and structures of chemicals, with an emphasis on molecules that are found in nature.', '1');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('3', 'MATH1000', 'Algebra 1', 'undergraduate', 'the instructional program in this course provides for the use of algebraic skills in a wide range of problem-solving situations.  The concept of function is emphasized throughout the course.', '2');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('4', 'MATH5000', 'Calculus 1', 'graduate', ' It covers the material of multivariable calculus and linear algebra from a thoroughly mathematical point of view as well as other topics chosen by the instructor.', '2');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('5', 'PYED1000', 'Yoga', 'undergraduate', 'Yoga is designed to improve the health, performance, and mental acuity of athletes or individuals interested in improving their level of fitness.', '3');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('6', 'PYED5000', 'Weight Training', 'graduate', 'Weight Training offers instruction and practice in proper techniques of the development of muscular strength, endurance, and flexibility', '3');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('7', 'ENGR1000', 'Thermodynamics', 'undergraduate', 'First and Second Laws of Thermodynamics with applications in food, biosystems, and environmental engineering.', '4');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('8', 'ENGR5000', 'Semiconductors Devices', 'graduate', 'Get an introduction to basic semiconductor vocabulary and concepts such as energy bandgap and minority carriers, and then pursue a more targeted investigation into the behaviors of semiconductor devices', '4');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('9', 'LAW1000', 'Constitutional Law ', 'undergraduate', 'Constitutional Law introduces the concept of judicial review of legislation and executive action. The course also focuses on the express and implied powers of the federal government and the effect of the interstate commerce clause on federal and state power.', '5');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('10', 'LAW5000', 'Criminal Law', 'graduate', 'This course examines the elements of crimes, defenses that the accused may assert, and the methods and rationales for punishing criminal conduct. Attention is given to the common law of crime as well as to the Model Penal Code.', '5');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('11', 'ENGL1000', 'Creative Writing', 'undergraduate', 'Creative writing courses expose students to a variety of types of writing and provide them with opportunities to create their own works.', '6');
INSERT INTO `srs`.`course` (`id`, `courseNumber`, `title`, `courseLevel`, `description`, `department`) VALUES ('12', 'ENGL5000', 'American Literature', 'graduate', 'The ultimate goals for this class are to expose students to American culture, heritage, and history through study of our literature; and, to continue advancement towards more mature, refined writing skills. ', '6');

INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('1', '21', 'Spring 2016', '1');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('1', '22', 'Spring 2016', '2');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('2', '23', 'Spring 2016', '1');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('2', '24', 'Spring 2016', '2');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('3', '25', 'Spring 2016', '11');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('3', '26', 'Spring 2016', '12');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('4', '27', 'Spring 2016', '11');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('4', '28', 'Spring 2016', '12');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('5', '16', 'Spring 2016', '6');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('6', '17', 'Spring 2016', '7');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('7', '29', 'Spring 2016', '4');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('8', '30', 'Spring 2016', '5');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('8', '31', 'Spring 2016', '4');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('9', '32', 'Spring 2016', '9');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('10', '33', 'Spring 2016', '10');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('11', '34', 'Spring 2016', '3');
INSERT INTO `srs`.`Section` (`course`, `location`, `semester`, `instructor`) VALUES ('12', '35', 'Spring 2016', '8');

INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('1', '1');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('1', '2');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('1', '3');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('1', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('2', '1');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('2', '2');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('2', '4');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('3', '1');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('3', '4');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('3', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('4', '1');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('4', '4');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('4', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('4', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('5', '3');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('5', '4');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('5', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('5', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('6', '3');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('6', '4');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('6', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('6', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('7', '3');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('7', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('7', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('7', '7');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('8', '3');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('8', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('8', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('8', '7');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('9', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('9', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('9', '9');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('9', '10');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('10', '5');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('10', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('10', '9');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('10', '11');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('11', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('11', '10');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('11', '11');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('12', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('12', '11');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('12', '12');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('13', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('13', '13');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('13', '15');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('14', '6');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('14', '14');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('15', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('15', '15');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('15', '16');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('15', '17');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('16', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('16', '13');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('16', '15');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('17', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('17', '10');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('18', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('18', '14');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('18', '15');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('19', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('19', '17');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('20', '8');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('20', '10');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('20', '12');
INSERT INTO `SRS`.`Registration` (`student`, `section`) VALUES ('20', '14');
