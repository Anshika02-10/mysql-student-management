# 🎓 Student Management System – MySQL Project

This project is a simple **Student & Marks Management System** built entirely with **MySQL**. It demonstrates the use of:

- ✅ Stored Procedures
- ✅ Triggers
- ✅ Cursors
- ✅ Indexing
- ✅ Foreign Keys

It’s a perfect example of how to implement database logic for a small-scale application using advanced SQL features.

---

## 📌 Features

- Add students and their subject marks using a **stored procedure**
- Automatically **log mark entries** using a **trigger**
- Loop through all student marks using a **cursor**
- Optimize data search with **indexing**
- Manage table relationships using **foreign keys**

---

## 🛠️ Technologies Used
--------------------------------------------------------------
| Tool                  | Description                        |
|-----------------------|------------------------------------|
| **MySQL**             | Relational database system         |
| **SQL**               | Structured Query Language          |
| **Stored Procedures** | For reusable logic                 |
| **Triggers**          | For automated event-based logic    |
| **Cursors**           | For row-by-row data handling       |
| **Indexes**           | For fast data lookup               |
--------------------------------------------------------------
---

## 🚀 How to Run the Project

        Open MySQL (Workbench / CLI)
        Run the SQL File:

           " SOURCE student_management_project.sql;"
        
        This will:
                -Create tables (students, marks, marks_log)
                -Set up foreign keys and indexing
                -Create procedures, triggers, and cursors
    
    for sample usage :
        ➕ Add a student and marks:

                "CALL AddStudentWithMarks('Ravi', 20, 'Math', 88);"

        📋 View all marks using a cursor:

                "CALL ListAllMarks();"

        📜 View log entries from trigger:

                "SELECT * FROM marks_log;"



### 1. Clone or Download the Repository
```bash
git clone https://github.com/yourusername/mysql-student-management.git





-- Options to import student_management_project.sql file in your system

1: MySQL CLI (Command Line)
✅ Steps:
Open Command Prompt or Terminal
Login to MySQL:
mysql -u root -p
Enter your MySQL password

Select your database:
USE your_database_name;
Run the script:
        SOURCE path/to/student_management_project.sql;

🔁 Example:
        SOURCE C:/Users/YourName/Documents/student_management_project.sql;

2: MySQL Workbench
✅ Steps:
Open MySQL Workbench

Open your database connection

Go to File → Open SQL Script and select your .sql file

Click the lightning bolt icon (⚡) or press Ctrl + Shift + Enter to execute

✅ Your full SQL script will now run, creating tables, procedures, triggers, etc.