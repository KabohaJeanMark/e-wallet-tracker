<img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white"/> <img alt="Rails" src="https://img.shields.io/badge/rails%20-%23CC0000.svg?&style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>

# e-wallet-tracker 

> A full stack rails application of a digital tracking mobile first designed website where users can create transactions and opt to group them in particular categories to analyse their expenditure with ease. The features are listed next to the screenshots.

## Live Demo

[Live Demo Link](https://sheltered-hamlet-43209.herokuapp.com/)

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.1.4

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: 2.7.2
- Rails: 6.1.4
- Postgres: >=9.5

### Setup

- Follow these instructions to get a local copy up and running
```
git clone https://github.com/KabohaJeanMark/e-wallet-tracker/
cd e-wallet-tracker
```
Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rspec --format documentation
```

### Project Runthrough
#### Sign Up
Authetication s handled by device:

- One can sign up with a valid profile image, username, email address and a password of atleast 6 characters.
- An already signed up user just needs their email and Password to log in.

![screenshot](app/assets/images/sign_up.png)

#### User Profile Page
- After sign up or login, one is directed to their user profile page.
- It contains their profile image and name at the top.
- Profile page has 3 links to the following pages.
- All groups
- All my transactions.(transactions created by logged-in user where the group was specified)
- All my external transactions(transactions created by logged-in user but where no group was specified)

![screenshot](app/assets/images/timeline.png)

#### All Users, user profile and Add Friend button
- One can see all users list.
- One can see selected user page with their user name and all posts written by them (the most recent posts on the top).
- One can send a friendship invitation.

![screenshot](app/assets/images/all_users.png)

#### Pending Friend Requests, Accept or Decline
- One can click on My Friend Requests to view all your incoming friend requests and either accept or decline them. 
- When you accept a friend request, it redirects to the Friends page that has a table showing all friends. 
- One can see pending friendship invitations sent to me from other users.
- One can accept or reject friendships invitation.


![screenshot](app/assets/images/friend_requests.png)

#### My Friends page to view all my accepted friends
- Once can click on Friends on the navbar to view all your friends in a tabular format with their emails and links to their profiles.

![screenshot](app/assets/images/my_friends.png)

## Author

👤 **Kaboha Jean Mark**

- GitHub: [@githubhandle](https://github.com/KabohaJeanMark)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/jean-mark-kaboha-software-engineer/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/KabohaJeanMark/e-wallet-tracker/issues/).

- Checkout to a feature branch and make your commits with descriptive messages here and raise a Pull Request
```
git checkout -b <ft-branch-name>
```

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Hat tip to Microverse for the README template, initial repo, instructions and tutoring for this Capstone project.

## Inspiration

The design idea for the template followed is by the team at Behance. 

## 📝 License

This project is [MIT](./LICENSE) licensed.

