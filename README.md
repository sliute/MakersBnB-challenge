# MakersBnB Challenge

## The Task
To build a web application that allows users to list spaces they have available, and to hire spaces for the night.

```
As a user
So I can make full use of MakersBnB
I want to be able to sign up to MakersBnB

As a user
So I can list one of my spaces
I want to be able to sign in to MakersBnB

As a user
So I can request a space
I want to be able to sign in to MakersBnB

As a user
So I can avoid others posting spaces as me
I want to be able to sign out from MakersBnB

As a user
So I can let people request my available space
I want to be able to list a space on MakersBnB

As a user
So I can see what spaces are available
I want to see the list of spaces in reverse chronological order

As a user
So I can request a place
I want to be able to choose it

As a user
So I can see the status of my spaces
I want to see them listed in my account

As a user
So I can see the spaces Im renting
I want to see them listed in my account
```

| User Story |                                Acceptance Criteria                                           |
|------------|----------------------------------------------------------------------------------------------|
|Sign Up        |Username, e-mail, BCrypt password, confirm p, flash msgs (unique details, incorrect inputs)|
|Sign In        |E-mail, password, authentication, flash msgs(incorrect inputs), allows renting and listing |
|Sign Out       |Flash msgs (goodbye)                                                                       |
|List Space     |Space name, description, price, flash msgs(incomplete/incorrect input)                     |
|View List Home |Display (in rev chronological order) name, description, price, request button when appropriate|
|View List Acc S|Display name and status (in chronological order)                                           |
|View List Acc R|Display name (in reverse chronological order)                                              |

## How To Download and Run the App

```
$ git clone https://github.com/sliute/MakersBnB-challenge.git
$ cd MakersBnB-challenge
$ bundle
$ psql
$ create database makersbnb_test
$ create database makersbnb_development
$ \q
$ rake auto_migrate
$ rspec
$ rackup
```

... then open [localhost:9292](http://localhost:9292) in a browser and enjoy.

## Authors

* Tamar Lehmann
* John Ashton
* Dylan Rhodius
* Stefan Liute
