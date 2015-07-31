README

## Statement

Music twin is a web-app where users (musicians) go to gain insight into like sounding artist's. These artists are called Twins. If a twin is ranked in the top 50 of a major metropolitain city they will be available to select. Once a user has selected their twins, the twins as well as their metro link save to the user's home page. The ultimate goal is to help musicians better plan their marketing campaigns.

## Technologies

- RAILS MVC
- RUBY
- BOOTSTRAP / CSS
- HTML

-HTTParty gem

In order to keep seed data updated make sure to plugin your custom API into the seed file. The seed file gathers top ranking artists in various metros and writes it to a yaml file. From there the data is then switched to represent artists and their top ranking cities. This was then written to a yaml file. The Twin model, was derived from the artists.yml file.

Pg_search gem

In order to do full and partial text search I chose to install the pg_search gem since it integrates well with postgres.

## Installation

Fork, clone, bundle install, rails s

To visit the app: https://stark-brushlands-5281.herokuapp.com/



## Unsolved

[x]The body needs to scroll down because all of the contents are showing

- Either keep the footer (using it to display flash messages), or render them elsewhere

- CSS is lacking

#### MVP

[x]
As a new user I'd like to be able to visit a page to learn more about this web app

[x]
As a new user I'd like to be able to sign up / create an account.

[x]
As a user I'd like to be able to login to my personal account so I don't have to regenerate analytics every time.

[x]
As a user I'd like to be able to create “twins” for my like-artists.

[x]
As a user I'd like to be able to change/modify my twins in case I mistyped info.

[x]
As a user I'd like to be able to delete twins in case I want to change my audience target.

[x]
As a user I'd like the site to be easy to use and intuitive.

#### ICEBOX

- As a user I'd like to be able to export my data so I can send it to other people that may be working on my campaign vs. giving them my login creddentials.

- As a user I'd like to be able to see a visual representation of the data I've requested rather than just numbers.

- As a user I'd like to be able to apply different filters for input so I can further target my and audience to meet my needs.

- As a user I'd like to be able to generate different campaigns with differing twin data so I can have multiple marketing campaigns.
