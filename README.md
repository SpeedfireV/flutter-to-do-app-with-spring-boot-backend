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

## Screenshots

### Login Page
![Login Screenshot](path_to_login_screenshot)

### Task List
![Task List Screenshot](path_to_task_list_screenshot)

### Add New Task
![Add Task Screenshot](path_to_add_task_screenshot)

## TODO

- **API Endpoints**:
    - `POST /api/auth/register`: Register a new user.
    - `POST /api/auth/login`: Log in a user.
    - `GET /api/tasks`: Retrieve the list of tasks.
    - `POST /api/tasks`: Add a new task.
    - `PUT /api/tasks/{id}`: Mark a task as completed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any issues or contributions, feel free to open a pull request or create an issue in the repository.

Happy coding!
