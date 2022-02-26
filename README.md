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


Steps
------

1. Fork this repo, and clone to your local machine
2. Run the command 'gem install bundler' (if you don't have bundler already)
3. When the installation completes, run 'bundle'
4. run 'rspec' to test the testcases
5. 'ruby lib/airport.rb' runs just the code 

Approach
---------

* I started with skimming through the complete challenge. Then written down what the challenge was all about.

* Did not exactly follow the noun, verb approach but was able to breifly write down the tasks each user story was asking us to do.

* When I started the TDD I faced a couple of issues with "simplecov" asking for ruby "3.0.2", it took me some time to figure out what was going on.

* I intially created two classes for landing and departure each but as I progressed to user story two it made more sense to have them as methods in one Airport class and use two different instances to test respective methods.

* Approaching one user story at a time really made a lot of difference to way I code.

* To my surprise I found TDD was actually the best thing to learn. I clubbed all the tests for a particular method under one "describe" and so on. Yikess, might have missed out on couple.

This is all I can think after 9 hours of problem solving.

Thank You :)
------------
