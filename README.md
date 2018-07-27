# Lightform Coding Exercise

## Getting Started

### Prerequisites

In order to run this exercise on a local environment, the following dependencies are required:

1. Git
3. Node.js with npm
4. A running MySQL instance (local or remote)

### Clone the repo

git clone https://github.com/georgeluna/Lightform.git

### Install dependencies

npm install

### Import SQL Database seed

Start up and connect to a MySQL instance and import the latest sql file located inside of ./db

You can then configure the database connectivity by modifying ./server/app-config.js

### Start the server

cd server

node lightform-server

By default, the website will run on http://localhost:8080

### Testing

There is a JSON file in the ./requests folder that can be imported into Postman in order to test the following web services:

- AddDevice
- GetAllDevices
- AssignDevice
- UnassignDevice