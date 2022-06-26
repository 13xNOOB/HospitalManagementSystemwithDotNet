Create Database If Not Exists HospitalManagementSystem;

--create table for doctors
Create Table If Not Exists Doctor(
    DoctorID varchar(5) Not Null Primary Key,
    DoctorName varchar(20),
    DoctorDept varchar(15),
    DoctorCharge int(5)
);

--create table for Patients
Create Table If Not Exists Patient(
    PatientID varchar(10) Not Null Primary Key,
    PatientName varchar(20),
    Age int(3),
    PatientWeight int(3),
    PatientGender varchar(10),
    PatientAddress varchar(255),
    PatientContactNo varchar(255),
    PatientDisease varchar(255),
    DoctorID varchar(5),
    Foreign Key (DoctorID) References Doctor(DoctorID),
    HealthCard varchar(20)
);

--create table for Lab
Create Table If Not Exists Lab(
    LabID varchar(5) Not Null Primary Key,
    TestName varchar(30),
    TestCharge int(4) 
);

--keep record of doctor, patient and lab together
--each lab room is assigned 1 type of test
--each patient can have 2 types of tests per appointment
--TotalMedicineCost is the cost of any medicine the patient needs
--OperationCharge is the cost of any operation: This can later be worked into a different table about OTs 
Create Table If Not Exists Appointment(
    AppointmentID varchar(255) Not Null Primary Key,
    TotalMedicineCost int(5),
    OperationCharge int(6),    
    PatientID varchar(5),
    DoctorID varchar(5),
    AppointedLabID1 varchar(5),
    AppointedLabID2 varchar(5),
    Foreign Key (PatientID) References Patient(PatientID),
    Foreign Key (DoctorID) References Doctor(DoctorID),
    Foreign Key (AppointedLabID1) References Lab(LabID),
    Foreign Key (AppointedLabID2) References Lab(LabID)    
);

--For patients who need to be admitted
Create Table If Not Exists InPatient(
    PatientID varchar(10),
    RoomNo varchar(5), 
    DateOfAdmission date, --YYYY-MM-DD
    DateOfDischarge date, --YYYY-MM-DD
    Advance int(5),
    LabID varchar(5),
    Foreign Key (LabID) References Lab(LabID)
);

--For patients who are discharged or did not need to be admitted
Create Table If Not Exists OutPatient(
    PatientID varchar(10),
    LabID varchar(5),
    Foreign Key (LabID) References Lab(LabID)
);

Create Table If Not Exists Room(
    RoomID varchar(10),
    RoomType varchar(50),
    RoomStatus varchar(15),
    RoomRent int(6)
);

Create Table If Not Exists Bill(
    BillID varchar(10),
    PatientID varchar(5),
    Foreign Key (PatientID) References Patient(PatientID) 
);
