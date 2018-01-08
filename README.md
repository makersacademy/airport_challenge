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


## Synopsis

We have a request from a client to write the software to control the flow of planes at an airport. Built in ruby, the software means planes can land and take off provided that the weather is good. Occasionally it may be stormy, in which case no planes can land or take off. he programme is also feature tested to make sure the whole system to make sure the planes and airports all work together well. 

For more details on the tast or to see the user stories click [here](https://github.com/Tagrand/airport_challenge/blob/master/instructions.md).

## My Approach

This week I tried to particularly focus on testing firstly building later. I found that as I did the project I focused on following a cycle of, building test, passing test, refactor, making test fail again, passing test again. These last two steps were key, since I made sure the tests, actually tested what I wanted, rather than passed blindly. 

Though I refactored throughout, I  also gave myself an hour midway through the test to review my code, and refactor it. I found this greatly helped me, as I saw alot of bits where I had over complicated the spec, and could simplify. This is something I want to do more in my pairing sessions, to produce more elegant code.   

## Getting started

`git clone https://github.com/Tagrand/airport_challenge.git`

`gem install bundle`

`bundle`

*note this runs using Ruby 2.4.0 if you do not have then run:* 

`rvm install 2.4.0`

`rvm use 2.4.0`



## Running tests

`rspec` to check the programme, also note the feature test is written in rspec too
`rubocop` to check the syntax 


##Contributions 

Thanks to @makersacademy for the project and as always, google for providing the endless base of examples and information that it does. 