# Flutter + Spring Boot Task Management App

This is a simple task management application built using **Flutter** for the frontend and **Spring Boot** for the backend. The app provides user authentication (Login/Register) and allows users to manage their tasks, including searching through tasks, checking completed ones, and adding new tasks.

## Features

- **User Authentication**:
    - Register and Login pages using **Spring Boot** for backend authentication.
    - Username (login) and password-based registration and authentication.

- **Task Management**:
    - Users can search through their tasks.
    - Tasks consist of a task title and a short description.
    - Users can mark tasks as completed.
    - Users can add new tasks.

## Tech Stack

- **Frontend**:
    - Built with **Flutter** for creating an intuitive and responsive user interface.
    - Features user authentication screens (Login and Register).
    - Task management UI to handle user tasks.

- **Backend**:
    - Developed using **Spring Boot** for handling API requests, authentication, and database management.
    - RESTful API for communication between the frontend and backend.
    - Secure user authentication and task data storage.

## How It Works

1. **User Authentication**:
    - On the login/register page, users can sign up or log in using a username (currently used as the login) and password.
    - Authentication is handled by the Spring Boot backend.

2. **Task Management**:
    - After logging in, users can view their list of tasks.
    - Each task consists of a **title** and a **short description**.
    - Users can mark tasks as completed or search through their existing tasks.
    - New tasks can be added via a form that captures the task title and description.

## Setup & Installation

### Prerequisites

- **Flutter SDK** installed for running the frontend.
- **JDK** and **Maven** installed for building and running the Spring Boot backend.
- A **MySQL/PostgreSQL/Any SQL** database for storing user and task data.

### Frontend (Flutter)

1. Clone the repository:
    ```bash
    git clone <repo_url>
    ```

2. Navigate to the Flutter app directory:
    ```bash
    cd flutter-app
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the Flutter app:
    ```bash
    flutter run
    ```

### Backend (Spring Boot)

1. Navigate to the backend directory:
    ```bash
    cd spring-boot-backend
    ```

2. Install Maven dependencies:
    ```bash
    mvn clean install
    ```

3. Configure the `application.properties` file with your database connection details:
    ```properties
    spring.datasource.url=jdbc:mysql://localhost:3306/taskdb
    spring.datasource.username=<your-username>
    spring.datasource.password=<your-password>
    ```

4. Run the Spring Boot application:
    ```bash
    mvn spring-boot:run
    ```

## API Endpoints

- **User Authentication**:
    - `POST /api/auth/register`: Register a new user.
    - `POST /api/auth/login`: Log in a user.

- **Task Management**:
    - `GET /api/tasks`: Retrieve the list of tasks.
    - `POST /api/tasks`: Add a new task.
    - `PUT /api/tasks/{id}`: Mark a task as completed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any issues or contributions, feel free to open a pull request or create an issue in the repository.

Happy coding!
