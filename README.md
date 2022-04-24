Airport Challenge
=================

```
        ______
        _\____\___
= = ==3(___F_I____)
          \_____\___________________,-~~~~~~~~-..__
          /     o o o( ) o o o o o o o o o( ) o o \_\__
          `~-.__     ( )__..----..__      ( )          )
                `---~~\___________/------------`````
                =  ===(_________)

```

Installation
------------
1. Fork this repo, and clone to local machine
2. Run the command `gem install bundler` (if bundler not installed already)
3. When the installation completes, run `bundle`

## How to test the code
-----------
1. Follow installation process
2. Navigate to the saved directory
3. Run Rspec
4. Run rubocop

## Project Information
-----------
* Forked and cloned from the makers academy repository 'airport_challenge' to be completed on a solo basis end of week 1 (23/04/2022 - 24/04/2022)
* Tasked to test drive the creation of a set of classes/methods to satisfy all user stories mentioned in the repository
* Can refer to coaches/other developers work but have to state it below

## Motivation
--------------
* Trying to put all learning from week 1 into this challenge, gauge progress and effectively use TDD to guide the creation of the program
* Unit, Manual and Feature testing are to be implemented here

Steps to be taken
-----------
1. Fork the original repo and clone to my local machine
2. Initialize the README file to include all of the information of the challenge
3. Break down the user stories (below - one at a time) into objects and behaviour (manually using pen and paper)
4. Create a domain model diagram to show how objects will use messages to communicate with one another (manualy using pen and paper)
5. Write a failing test on IRB (interactive Ruby, type IRB into terminal to run)
6. Write the bare minimum code to make test pass
7. Check that the test passes
8. Run feature test and check it still works
9. Repeat steps 3 - 8 for each user story

## User Stories
---------------
Request from a client to write the software to control the flow of planes at an airport. 
The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  
Below are the user stories that were worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

* Finally, submit a pull request before Monday 25/04/2022 at 10am with solution or partial solution.  However much or little amount of code wrote.

## Summary of the challenge
----------------------------
* Ended up writing a spec that fulfilled the first four user stories
* This was discarded after referring to the below work of another cohort developer (Feb '22)
* My weather method did not go to plan and I did not have a way to meet the last two user stories
* I ended up making a separate weather file and spec, which met the user stories in question
* Test coverage of 98.44% using rspec on the terminal (10 examples, 0 failures)
* Test coverage lowed due to 83.33% coverage in `weather.rb` file
* Rubocop: verified files have no offenses present

## References
--------------
* https://github.com/makersacademy/airport_challenge
* https://github.com/heykathl/airport_challenge
