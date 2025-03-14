# Mega_City_Cab - Web Application
Mega City Cab is an innovative cab service application for Colombo, designed to streamline ride bookings and management. Key features include secure user login, real-time tracking, and automated fare calculations. This repository contains the source code and documentation for the app, aimed at enhancing urban transportation efficiency.

## Overview
Mega City Cab is a **Java-based web application** designed to streamline the cab booking process. It allows customers to register, book rides, track drivers, make payments, and view ride history. The system also includes an **admin panel** for managing drivers, vehicles, and user activities.

## Screenshots


## Table of Contents
- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction
Mega City Cab is designed to provide a smooth and efficient ride-booking experience. Users can register, log in, and book rides, while drivers are assigned based on availability. The admin panel allows management of drivers, vehicles, and users. 

## Technologies Used
- **Java 21.0.5**: Backend development.
- **JDBC & MySQL**: Database connectivity and management.
- **JSP & Servlets**: Dynamic web page rendering and business logic.
- **Bootstrap & Tailwind CSS**: Frontend styling and responsiveness.
- **Git & GitHub**: Version control and collaboration.
- **phpMyAdmin**: MySQL database management.

## Installation
To run this project locally, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/nahlanisthar/Mega_City_Cab.git
   ```

2. Set up the database:
   - Open phpMyAdmin.
   - Create a new database named **mega_city_cab**.
   - Import the provided SQL file (if available).

3. Configure database connection:
   - Ensure JDBC URL is set to:
     ```
     jdbc:mysql://localhost:3306/mega_city_cab
     ```
   - Java Database Driver:
     ```java
     Class.forName("com.mysql.cj.jdbc.Driver");
     ```

4. Open the project in NetBeans or any Java-supported IDE.
5. Run the application using the server (Tomcat or GlassFish).

## Usage
- Users can **register, log in, and book rides**.
- Admins can **manage drivers, vehicles, and users**.
- The system ensures **secure authentication and session management**.
- Live tracking and fare calculation features enhance the user experience.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature:  
   ```sh
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```sh
   git commit -m "Added new feature"
   ```
4. Push to your branch:
   ```sh
   git push origin feature-name
   ```
5. Open a pull request.

## License
This project is licensed under an open-source license (TBD).

## Contact
For any queries, contact **nahla.nisthar@gmail.com**.



