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

/home/ubuntu/app/
├── bash_scripts/
│   ├── health_check.sh
│   ├── backup_api.sh
│   └── update_server.sh
├── setup_cronjobs.sh
└── README.md
🛠️ Scripts Overview
1. health_check.sh
Purpose: Monitors server resource usage and API health.

Checks:

CPU, memory, and disk space

Web server status (Apache/Nginx)

API endpoint responses for /students and /subjects

Logs to: /var/log/server_health.log

2. backup_api.sh
Purpose: Backs up Django project files and SQLite database.

Backs Up:

Django project directory (/var/www/your_django_project)

SQLite DB (db.sqlite3)

Backup Location: /home/ubuntu/backups/

Deletes backups older than 7 days

Logs to: /var/log/backup.log

3. update_server.sh
Purpose: Automates system and API updates.

Performs:

apt update and apt upgrade

git pull on API project

Web server restart

Fails safely if Git pull fails

Logs to: /var/log/update.log

⏰ Automated Scheduling (Cron Jobs)
The script setup_cronjobs.sh sets up all required cron jobs as the root user.

📅 Cron Schedule
Script	Frequency	Time
health_check.sh	Every 6 hours	0 */6
backup_api.sh	Daily	2:00 AM
update_server.sh	Every 3 days	3:00 AM

⚙️ Setup Instructions
1. Make All Scripts Executable
bash
Copy
Edit
chmod +x bash_scripts/*.sh setup_cronjobs.sh
2. Run Cron Setup Script as Root
bash
Copy
Edit
sudo ./setup_cronjobs.sh
This will:

Validate the script paths

Overwrite root's crontab with the new jobs

Restart the cron daemon

📌 Notes
Make sure the bash_scripts/ directory contains the latest versions of all three scripts.

Update paths in the scripts (e.g., PROJECT_DIR) to match your environment.

Ensure the server has the necessary permissions and dependencies (curl, git, tar, etc.).

