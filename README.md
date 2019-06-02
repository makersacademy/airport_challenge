
Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Introduction
---------
This is my attempt at the Makers Academy Week 1 challenge. The original instructions can be found in the ORIGINAL_README.md file.

Instructions
-----------
* Fork this repo, and clone to your local machine
* Run the command `gem install bundle` (if you don't have bundle already)
* When the installation completes, run `bundle`
* There is no current executable - so repo can't be run pe se.
* There are feature tests of a number of scenarios. This can be run via `ruby /spec/feature_test.rb`

Structure
---------
Three classes - `*airport*`, `*plane*` and `*weather*`.
Each one has a set of unit tests. To check the unit tests please use the command `rspec`
This will also give the overall test coverage.

Challenges / Thoughts
-------------
* The weather class might be better as a module?
* There are no exceptions or errors raised. Only `puts` statements. This needs further work to understand these concepts before incorporating.
* My gut feeling is that this could be simplified. It went through multiple iterations and refactoring. The `plane` class was simplified and remains only with a state.
* Testing scenarios with multiple conditionals - I have got very confused here. My feeling is that there are some redundant tests.