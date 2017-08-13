# README

![Build Status](https://codeship.com/projects/739dd330-584a-0135-ffa5-0a1b085fd2b6/status?branch=master)
![Coverage Status](https://coveralls.io/repos/eliza-jane/urbgarden/badge.png)

## UrbGarden (Breakable Toy)
###Launch Academy, August 2017

UrbGarden is a site to bridge the gap between local growers and their potential customers. Growers create an account to manage/showcase their products and events, and site visitors can make orders to pick them up at an event of their choosing.

###Technologies

UrbGarden takes advantage of several different technologies. The site itself is split into three components:

(1) The homepage: built in React.js
(2) The showpage(s): one for each event on the homepage, also built in React.js. (These two aforementioned pages are connected with React Router to minimize page reloads.)
(3) The public profile page: one for each user who signs up, built in Rails.

All forms are built in Rails. Authentication is managed with Devise. Mail is handled by ActionMailer and Mailgun. The future of this app is a more React-focused frontend to make for a better user experience.

###Setup

To set up this program on your system, run

```
bundle
rake db:create
rake db:migrate
rails s
```

In separate terminal tab, run the following:

```
yarn
yarn start
```

If `yarn` gives you an error, try running `npm install` to make sure you are set up with all the appropriate `node` modules.


Next, navigate to localhost:3000. The site should show up after this.

To run the Ruby tests, run `rake` or `rspec`.
To run the React tests, run `karma start`.

Please refer to the `.env.example` file to see what API keys/etc. you will need to set up for this app.
