create table Parent 
(parent_id    int PRIMARY KEY,
 first_name   varchar(50),
 last_name    varchar(50),
 gender       varchar(20), 
 email        varchar(50),
 phone_number int,
 address      varchar(100),
 emergency_contact varchar(100),
 status        varchar(10),
pref_payment_method varchar(20)
);
 
 create table babysitter
( babysitter_id   int primary key,
  first_name      varchar(50),
  last_name       varchar(50),
   email           varchar(50),
   gender          varchar(20),
   phone           int,
   address         varchar(100),
   date_of_birth   datetime,
   hourly_rate   int,
   min_age         int,
   working_range   varchar (100),
   bank_acount_num  int,
   years_of_experience int
   );
   
   create table child (
   child_num    int,
   parent_id   int, 
   first_name  varchar(25),
   last_name   varchar(25),
   age         int,
   gender      varchar(20),
   address     varchar(50),
   bed_time     datetime,
   favorit_activity  varchar(50),
   additional_comments  varchar(200),
   foreign key (parent_id) references parent(parent_id),
   primary key (child_num, parent_id)
   );
   
 
create table meeting (
   meeting_id   int primary key,
   parent_id    int,
   babysitter_id int,
   start_time   datetime,
   end_time     datetime,
   city         varchar(20),
   street       varchar(20),
   house_num    int,
   foreign key (parent_id) references parent(parent_id),
   foreign key (babysitter_id) references babysitter(babysitter_id)
   );
   
     create table review 
   (review_id   int,
  parent_id   int,
  babysitter_id  int,
  meeting_id  int,
  ratting   int,
  comments  varchar(100),
  foreign key (parent_id) references parent(parent_id),
  foreign key (babysitter_id) references babysitter(babysitter_id),
  foreign key (meeting_id) references meeting(meeting_id),
  primary key (review_id)
  );


   create table payment 
   (payment_id   int primary key,
   parent_id    int,
   babysitter_id int,
   payment_method varchar(20),
   payment_date  datetime,
   status       varchar(20),
   discount    int,
   additional_payments  int,
   foreign key (parent_id) references parent(parent_id),
   foreign key (babysitter_id) references babysitter(babysitter_id)
   );