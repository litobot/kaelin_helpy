# Frankenstein

This repository requires and has been tested on Ruby v3.2.2 and is based on Rails 7.1.3.

**RSpec** and **Shoulda-Matchers** have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

- Work on this assessment independently. DO NOT discuss with anyone.
- You are allowed to use any references including notes, Google, lesson plans, etc.
- Read each story carefully before you start working.
- Commit Frequently, about every 15 - 30 minutes
- Push your code to your fork **once the time is up (not before!)**

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

- Your Name
- A reflection on how you felt you did with this challenge and what story you got through

## Requirements

- TDD all new work
- model methods and relationships must be fully tested.

## Not Required

- No visual styling is required or expected
- You do not need to test for or create any model validations.

## Description

Frankenstein is an app that allows a user to see labs, scientists, and experiments. Make sure to read all instructions, tasks, and user stories before getting started.

## Database information

- Labs have a name
    - Ex: name: “Fermilab”
- Scientists have a name, specialty, and university attended
    - Ex: name: “Marie Curie”, specialty: “radioactivity”, university: “University of Paris”
- Experiments have a name, objective (description), and a num_months attribute which represents the duration of the experiment
    - Ex: name: “MINERvA”, objective: “study neutrino reactions with five different nuclei”, num_months: 4
- Labs have many scientists
- Scientists belong to a lab
- Scientists have many experiments
- Experiments can have many scientists

Some of the initial migrations and model set up has been done for you.

## User Stories

```
User Story 1, Scientist Show Page

As a visitor
When I visit a scientist's show page
I see all of that scientist's information including:
 - name
 - specialty
 - university where they got their degree
And I see the name of the lab where this scientist works
And I see the names of all of the experiments this scientist is running
```

```
User Story 2, Remove an Experiment from a Scientist

As a visitor
When I visit a scientist's show page
Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
When I click that button for one experiment
I'm brought back to the scientist's show page
And I no longer see that experiment's name listed
And when I visit a different scientist's show page that is working on that same experiment,
Then I see that the experiment is still on the other scientist's work load
```

```
User Story 3, Experiment Index Page

As a visitor
When I visit the experiment index page
I see the names of all long running experiments (longer than 6 months),
And I see the names are in descending order (longest to shortest)
```
### Extensions
```
Extension, Lab Show Page

As a visitor
When I visit a lab's show page
I see the lab's name
And I see the names of all scientists that work at this lab,
And next to each scientist I see the number of experiments associated with the scientist,
And I see the list of scientists is ordered from most number of experiments to least number of experiments
(Scientist experiment counts should be a single query)
```
