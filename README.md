# 🩺 HaloDoc Database Needs Analysis

A database design and analysis project focused on supporting the backend infrastructure of **HaloDoc**, a leading healthcare web and mobile application.

---

## 🔍 Project Summary

This project explores the **business case**, **data flow**, and **backend data requirements** for the HaloDoc platform. We identify core features such as patient-doctor interaction, appointment management, and e-prescriptions, and translate them into a normalized database structure using ERD and SQL schema.

---

## 🧠 Business Use Case

The HaloDoc platform allows users to:
- Register and maintain health profiles
- Book consultations with licensed doctors
- Receive prescriptions and buy medication online
- Access pharmacy and hospital partners

Our analysis outlines the data flow across these functions and how a properly designed relational database can ensure **data integrity, privacy, and performance**.

---

## 🧪 Jupyter Notebook (Business Logic Simulation)

We include a Jupyter Notebook that simulates:
- Patient registration data
- Appointment and consultation tracking
- SQL-like analysis of user behavior
- Basic visualizations (bar charts, timelines)

🗂️ File: visual.zip`

> Open with **Visual Studio Code (VS Code)** using the **Python & Jupyter extension**.

---

## 🧬 Entity Relationship Diagram (ERD)

Designed using **draw.io** and exported as both PNG and XML.

🖼️ File: `erd-holadoc.jpeg`  

**Key Entities:**

All relationships normalized to **Third Normal Form (3NF)**.

---

## 🧾 SQL Schema File

A full schema to implement the ERD using **MySQL** syntax.

🗂️ File: `holadoc_schema.sql`

Includes:
- `CREATE TABLE` statements with foreign key constraints
- Indexing on key fields (e.g., doctor_id, appointment_id)
- `INSERT INTO` examples for testing
- Sample `SELECT JOIN` queries for analytics

---

## 🌐 Web/App System Analysis

We provide a functional and structural breakdown of how the database supports:

- **Front-end App Usage**
  - Doctor availability
  - Booking and calendar sync
  - User medical history display

- **Back-end Workflows**
  - Secure patient data storage
  - Prescription validation
  - Integration with pharmacy and transaction system

📄 File: `data_requirement_holadoc.pdf`  
Includes: Use Case Diagram, Flowchart, and Data Flow Diagram (DFD)

---

## 👨‍💻 Team Members

- Frederick Garner Wibowo  
- Fransiskus Brian
- Vincent Chandler
- Alessandro Fayes
- Jonathan Kharisma

> Universitas Multimedia Nusantara – Database Systems Project

---

## 🧰 Tools Used

- `Jupyter Notebook` + `Pandas` for analysis  
- `draw.io` for ERD  
- `MySQL` for schema  
- `VS Code` with Python & Jupyter extensions  

---

## 📄 License

This project is academic in nature. Data and structure are hypothetical and do not reflect real HaloDoc systems.

---

