create table if not exists user_role(
	role_id	serial Primary Key,
	role_name 	varchar(100) not null unique
);

Create table IF NOT EXISTS users(
	user_id		serial Primary key,
	name 			varchar(150) not null ,
	email			varchar (150) not null unique,
	password 		varchar(50)  not null,
	role_id 		int  not null,
	NIC 			varchar(13) ,
	mobile 		varchar(20),
	registration_date date Default now(),
	city 			varchar(50),
	country 		varchar(50),
	CONSTRAINT fk_User_Role
     FOREIGN KEY(role_id) 
	REFERENCES user_role(role_id)
	ON DELETE CASCADE 
);
create table if not exists crops(
	crop_id serial Primary Key,
	crop_name varchar(100)
);
Create Table if not exists farm(
	Farm_id 		serial Primary Key,
	Farm_Owner	int not NULL,
	crop_id 		int not NULL,
	total_acre 	numeric,
	logitude		numeric,
	latitude		numeric,
	address 		varchar(100),
	constraint fk_Crop 
	Foreign Key(crop_id)
	References crops(crop_id),

	constraint fk_FarmOwner 
	Foreign Key(Farm_Owner)
	References users(user_id)


);

Create table if not exists Farm_Managers(
	Farm_Manager	int not NULL,
	Farm_id		int not NULL,
	constraint fk_Farm_Manager
	Foreign Key(Farm_Manager)
	References users(user_id),

	constraint fk_Farm 
	Foreign Key(Farm_id)
	References Farm(Farm_id)


);

create table if not exists Cases(
	Case_id		serial Primary Key,
	case_topic		varchar(100),
	case_desc		varchar(1000),
	Farm_id		int NOT NULL,
	crop_id		int NOT NULL,
	Consultant_id	int NOT NULL,
	case_status	varchar(50) Default 'Pending',
	assignment_date	date Default now(),
	closing_date	date Default NULL,
	remarks		varchar(1000) default NULL,

	constraint fk_Farm1 
	Foreign Key(Farm_id)
	References Farm(Farm_id),

	constraint fk_Crop1 
	Foreign Key(crop_id)
	References crops(crop_id),

	constraint fk_Consultant 
	Foreign Key(Consultant_id)
	References users(user_id)


);


create table if not exists Images(
	image_id	Serial Primary Key,
	Image_name	varchar(200),
	Case_id	INT NOT NULL,
	constraint fk_case
	Foreign Key (Case_id)
	References Cases(Case_id)
);


insert into crops(crop_name) values
('Tomato'),
('Tobacco'),
('Mustard'),
('Potato'),
('Onion'),
('Linseed '),
('Gram'),
('Garlic'),
('Coriander'),
('Barley'),
('Sugarcane'),
('Rice'),
('Cotton'),
('Bajra'),
('Jowar'),
('Maize '),
('Seasamum'),
('Turmeric '),
('Chillies'),
('Soyabean'),
('Safflower'),
('Sunflower'),
('Groundnut');

