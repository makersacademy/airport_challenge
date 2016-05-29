Airport Challenge
=================
 
[![Build Status](https://travis-ci.org/Alex-Swann/airport_challenge.svg?branch=master)](https://travis-ci.org/Alex-Swann/airport_challenge)

# Alex Swann Airport Challenge

Unfortunately from the outset, I misinterpreted the user stories and instead thought the focus regarding maximum airport capacity was in reference to number of passengers in the airport, rather than the number of planes in the hangar. Due to this I haven't specified any limitation to the number of planes in the airport but have limited the number of passengers there should be in a given airport...whoops! To add to that I seemed to add all funcitonality regarding landing/taking off/and weather to the plane itself rather than the airport. When you think about what I plane does (takes off/lands/keeps on eye out on the weather) it's obvious why I might have unintentionally gone down this route. When relflecting at the end it occurred to me that, for the purposes of the program, the code itself wouldn't be much help then to an air traffic controller as they would be based at an airport...(duuuh!) I think the main reason this also happened was maybe how I approaching drawing up my domanin model at the very start. I believe overall it was correct but the method for taking_off/landing and the weather should have been applied to the airport class instead( see below).

<a href="http://imgur.com/fQrgIqu"><img src="http://i.imgur.com/fQrgIqu.png" title="source: imgur.com" /></a>

Anyway, my feature tests when implementing the program however have good readability and seem to mimic what should be going on apart from the missing default capacity the airport should have. And in retrospect to the methods int he classes, these could always be mapped to the appropriate buttons for the Air Traffic Controller so he could utilise the interface of the program in the same way even though more behaviour has been encapsulated by the Plane class. Overall a good lesson learnt! I understand and feel comfortable/familiar with everything we covered this week, I just need to work on maybe how I interpret the user stories and how these are then reflected in all my class behaviours.

### Feature Tests
<a href="http://imgur.com/qsrH0e4"><img src="http://i.imgur.com/qsrH0e4.png" title="source: imgur.com" /></a>
