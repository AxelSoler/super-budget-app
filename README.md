![](https://img.shields.io/badge/Microverse-blueviolet)

# Super Budget App

> Description the project.

## Built With

- Ruby on Rails
- PostgreSQL
- devise / devise-jwt - for authentication
- cancancan - for authorization

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

### Setup

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone 
cd super-budget-app
bundle install
```

- You will need a `.env` file before you install and run the project. The `.env` file contains environment variables needed to deploy the webpage. There is a commented `.env.example` file you can use as a guide to configure your own. Type the following commands into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```
cp .env.example .env

rails secret
```

- Edit file .env

  - Provide the values for the variables
    - DATABASE_HOST
    - DATABASE_USER
    - DATABASE_PASSWORD
    - DEVISE_JWT_SECRET_KEY
  - Assign the value returned by the `rails secret` to DEVISE_JWT_SECRET_KEY.

- Type this commands into the terminal:

```
rails db:reset
```

### Run application

- Type this command into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Testing

- Type this command into the terminal:

```
rspec
```

## Authors

👤 **Axel Soler**

- GitHub: [@AxelSoler](https://github.com/AxelSoler)
- LinkedIn: [Axel Soler](https://www.linkedin.com/in/axel-soler-685985232/)
- Twitter: [Axel Soler](https://twitter.com/AxelSoler18)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/) for the motivation.

## 📝 License

Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella).
This project is [MIT](./MIT.md) licensed.
