--Student table
create table student (
	id INTEGER not null,
	firstName VARCHAR(20) not null,
	lastName VARCHAR(30) not null,
	dateOfBirth DATE not null,
	enrolledDate DATE ,
	gender VARCHAR(10) not null,
	nationalIdNumber INTEGER not null,
	studentCardNumber INTEGER not null
);

select * from student s;


--Adding data in student table
insert into student(id,firstname,lastname,dateofbirth,enrolleddate,gender,nationalidnumber,studentcardnumber) 
values
(2, 'Ana', 'Jovanoska', '2004-12-25', '2024-11-11', 'female', 035453, 53252),
(3, 'Petar', 'Mitev', '2004-10-14', '2024-12-12', 'male', 64353, 63462);

--Teacher table
create table teacher(
	id INTEGER not null,
	firstName VARCHAR(20) not null,
	lastName VARCHAR(30) not null,
	dateOfBirth DATE not null,
	academicRank VARCHAR(20) not null,
	hireDate DATE not null
);

select * from teacher t;

--Adding data in table

insert into teacher (id,firstname,lastname,dateofbirth,academicrank,hiredate) 
values 
(1, 'Borche', 'Borisovski', '1995-12-25', 'programmer', '2020-01-01'),
(2, 'Hristina', 'Bozinoska', '1998-12-20', 'programmer', '2023-01-01'),
(3, 'Ivan', 'Apostolovski', '1999-10-10', 'programmer', '2023-01-01');



--Course table

create table course(
	id INTEGER not null,
	name VARCHAR(30) not null,
	credit VARCHAR(20) not null,
	academicYear VARCHAR(10) not null,
	semestar VARCHAR(10) not null	
);

select * from course c;

--Adding data in table

insert into course (id,name,credit,academicyear,semestar)
values 
(1,'SQL','5','2023/2024','second'),
(2,'NodeJs','8','2023/2024','second'),
(3,'JavaScript','10','2023/2024','first');


-- create AchivmentType table

create table achivmentType (
	id INTEGER not null,
	name VARCHAR(30) not null,
	description text not null,
	participationRate INTEGER not null
);

select * from achivmentType a;


--Adding data in table

insert into achivmentType(id,name,description,participationrate)
values 
(1,'front-end developer', 'best proggramer', 8),
(1,'back-end developer', 'best proggramer in servers', 7),
(1,'full-stack developer', 'best proggramer ever', 10);

--Create grade table

create table grade(
	id INTEGER not null,
	stundetId INTEGER,
	courseId INTEGER,
	teacherId INTEGER,
	grade INTEGER not null,
	comment text,
	createdDate DATE not null
);

select * from grade g;


insert into grade(id,studentid ,courseid,teacherid,grade,comment,createdDate)
values 
(7,3,2,2,4,'worst grade', '2024-03-02')

delete from grade where id = 3;


--Create gradeDetalis table

create table gradeDetalis(
	id INTEGER not null,
	gradeId INTEGER,
	achivmentTypeId INTEGER,
	achivmentPoints INTEGER not null,
	achivmentMaxPoints INTEGER not null,
	achivmentDate DATE not null
)

select * from gradeDetalis;


--Adding data in table

insert into gradedetalis (id,gradeid,achivmenttypeid,achivmentpoints,achivmentmaxpoints,achivmentdate)
values 
(2,4,1,5,8,'2024-05-01');


--Relations, grade-student relations

alter table grade 
add foreign key (studentId) references student(id);

--To visit relation grade-student
select * from grade
inner join student on grade.studentid = student.id;

--Relations, grade-teacher relations

alter table grade
add foreign key(teacherId) references teacher(id);

--Relations, grade-course relations

alter table grade
add foreign key(courseId) references course(id);

--Relations, gradeDetalis-grade relations

alter table gradedetalis  
add foreign key(gradeId) references grade(id);

--Relations, gradeDetalis-achivmentType relations

alter table gradedetalis 
add foreign key(achivmenttypeid) references achivmentType(id);




