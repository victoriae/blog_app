# README

## About this project

This is a practice project, it has the basic functionalities of a blog:
- Category and Articles CRUD, and the option to add comments to an article
- It use Devise for user authentication
- There are 2 types of user: Admin and Editor
- Each user type has its own privileges manages with CanCanCan gem. See models/ability.rb
- It use Active Storage and Action Text with Trix Editor
- It has dummy data. See db/data/ files
## Install

### Prerequisites

- Ruby 3.0.0
- Rails 6.1
- PostgreSQL 12.6 
- imagemagick
- [Bundler](https://github.com/bundler/bundler)
- [Yarn](https://github.com/yarnpkg/yarn)

### Clone the repository

```shell
git clone git@github.com:victoriae/blog_app.git
cd blog_app
sudo apt install imagemagick
```

### Install dependencies

```shell
bundle i
```

### Initialize the database

```shell
rails db:create db:migrate seed:migrate
```
