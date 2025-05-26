# Django API Project: Students and Subjects

## Overview

This project is a Django-based API that provides endpoints for retrieving student and subject information. It's designed to be simple to set up and use, providing a clear structure for managing data related to students and their academic programs.

## Features

* **`/api/students/` Endpoint:**
    * Returns a JSON list of students, including their names and enrolled programs.
    * Ensures a minimum of 10 students in the response, creating dummy entries if needed.
* **`/api/subjects/` Endpoint:**
    * Returns a JSON list of subjects associated with the Software Engineering program.
    * Lists subjects from Year 1 to Year 4, indicating the academic year for each subject.
* **Django Admin Interface:**
    * The `admin.py` file registers the `Student` and `Subject` models, enabling easy management of data through Django's admin panel.

## Setup Instructions

1.  **Prerequisites:**
    * Python 3.x installed.
    * pip installed.
    * A virtual environment is highly recommended.

2.  **Installation:**
    * Clone the repository from GitHub:
        ```bash
        git clone https://github.com/sherlock-07/Deployment.git
        cd deployment
        ```
    * Create a virtual environment (recommended):
        ```bash
        python -m venv venv
        source venv/bin/activate  # On Linux/macOS
        venv\Scripts\activate  # On Windows
        ```
    * Install the dependencies:
        ```bash
        pip install Django
        pip install djangorestframework
        ```

3.  **Project Setup:**
    * Navigate to the project directory and ensure you have the `api` app.
    * Add `'api'` and `'rest_framework'` to `INSTALLED_APPS` in `deployment/settings.py`:
        ```python
        INSTALLED_APPS = [
            # ...
            'api',
            'rest_framework',
        ]
        ```

4.  **Database Setup:**
    * Run the database migrations:
        ```bash
        python manage.py migrate
        ```
    * Create a superuser to access the admin interface:
        ```bash
        python manage.py createsuperuser
        ```

5.  **Run the Development Server:**
    * Start the Django development server:
        ```bash
        python manage.py runserver
        ```

## Usage

The API will be accessible at:

* `http://127.0.0.1:8000/api/students/`
* `http://127.0.0.1:8000/api/subjects/`

You can use any web browser or HTTP client (like curl, Postman, or Insomnia) to access these endpoints.

## Dependencies

* Python
* Django
* Django REST Framework

## Configuration

* The database configuration is in `deployment/settings.py`. By default, it uses SQLite. You can change it to use other databases like PostgreSQL, MySQL, etc.
* The API endpoints are defined in `api/urls.py`. You can modify them as needed.
* The data returned by the API can be modified in `api/views.py`.  Specifically, the `SubjectListAPIView` may need to be adjusted to correctly filter subjects for your Software Engineering program.
* The `api/admin.py` file registers the models with the Django admin interface.
