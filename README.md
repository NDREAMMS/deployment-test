# E-commerceV2

This is a Django-based e-commerce project.

## Features
- Product and category management
- Product listing and detail pages
- Category listing and detail pages

## Requirements
- Python 3.13+
- Django 6.0+
- Pillow

## Setup
1. Create and activate a virtual environment (already present as `myenv`).
2. Install dependencies:
   ```bash
   myenv\Scripts\pip install -r requirements.txt
   ```
3. Run migrations:
   ```bash
   myenv\Scripts\python.exe ecommerceV2/manage.py migrate
   ```
4. Start the development server:
   ```bash
   myenv\Scripts\python.exe ecommerceV2/manage.py runserver
   ```

## Project Structure
- `ecommerceV2/` - Django project settings
- `products/` - App for product and category management
- `images/` - Image uploads

## Notes
- This project is for development/testing only. Do not use in production without proper configuration.
# deployment-test
