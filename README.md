# Pokémon Collection Web Application (PokéPlaza)

## Overview
PokéPlaza is a Ruby on Rails web application that allows users to browse Pokémon and manage a personalized collection. Guests can explore all available Pokémon, while authenticated users can add Pokémon to their collection, assign nicknames, and remove entries. The application emphasizes clean architecture, data integrity, and automated testing.

## Technologies Used
- Ruby 3.2.5
- Ruby on Rails 7.1
- SQLite (ActiveRecord)
- Devise (authentication)
- Bootstrap & Sass (styling)
- JavaScript (fetch/AJAX interactions)
- RSpec, Capybara, FactoryBot, Shoulda Matchers (testing)

## Key Features
- User authentication with Devise
- Guest browsing and authenticated user workflows
- CRUD operations for a user-owned Pokémon collection
- Many-to-many data model with enforced uniqueness
- Search by name or Pokédex number
- Incremental “Load More” pagination using limit/offset queries
- Idempotent database seeding for repeatable setup
- End-to-end system tests covering happy-path and error scenarios

## Data Model
- A user can collect many Pokémon
- A Pokémon can belong to many users
- A join table enforces uniqueness to prevent duplicate collection entries

## Testing
The application includes system-level automated tests using RSpec and Capybara to validate:
- Successful and failed user registration
- Guest Pokémon browsing with and without seeded data
- Authentication-dependent UI behavior

## Setup & Execution
### Local Development
1. Install dependencies:
   ```bash
   bundle install
2. Prepare the database (migrations + seed data):
   rails db:migrate
   rails db:seed
3. Start the application:
   rails server

*** Containerized Execution
The project includes a Docker entrypoint script that automatically prepares the database (rails db:prepare) when the application starts inside a container, enabling repeatable and reliable startup behavior.
