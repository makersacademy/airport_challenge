Airport Challenge
=================
 
[![Build Status](https://travis-ci.org/Alex-Swann/airport_challenge.svg?branch=master)](https://travis-ci.org/Alex-Swann/airport_challenge)

# Alex Swann Airport Challenge

Unfortunately from the outset, I misinterpreted the user stories and instead thought the focus regarding maximum airport capacity was in reference to number of passengers in the airport, rather than the number of planes in the hanger. Due to this I haven't specified any limitation to the number of planes in the airport but have limited the number of passengers there should be in a given airport...whoops! To add to that I seemed to add all funcitonality regarding landing/taking off/and weather to the plane itself rather than the airport. When you think about what a plane does (takes off/lands/keeps on eye out on the weather) it's obvious why I might have unintentionally gone down this route. When reflecting at the end it occurred to me that, for the purposes of the program, the code itself wouldn't be much help then to an air traffic controller as they would be based at an airport...(duuuh!) I think the main reason this also happened was maybe how I approached drawing up my domain model at the very start. I believe overall it was correct but the behaviour for taking_off/landing and the weather should have been applied to the Airport class instead (see below).

<a href="http://imgur.com/fQrgIqu"><img src="http://i.imgur.com/fQrgIqu.png" title="source: imgur.com" /></a>

Anyway, my feature tests when implementing the program however have good readability and seem to mimic what should be going on apart from missing any set capacity that the airport should have for the planes. And in retrospect to the methods in the classes, these could always be mapped to the appropriate buttons for the Air Traffic Controller so he/she could utilise the interface of the program in the same way even though more behaviour has been encapsulated by the Plane class. Overall a good lesson learnt! I understand and feel comfortable/familiar with everything we covered this week, I just need to work on maybe how I interpret the user stories and how these are then reflected in all my class behaviour. In the end this exercise has reinforced everything I've learnt this week, not only through the extra material learnt from doing the exercise, but overall, once again, it's been about how I should take a step back when thinking about how to approach the problem. The funny thing is, if I had been pair programming, the other person would have probably pulled me up on both these issues within the first 10 minutes of drawing up the domain model.

### Feature Tests
N.B. I would rather construct a fully fledged feature test at Makers with either my pair next week or during any potential workshop either my cohort or Makers come up with. For now I'm happy with what I've covered this weekend without needing to add an additional 'thing' to go over mentally, to give myself time to reflect on everything so far. :-)

<a href="http://imgur.com/qsrH0e4"><img src="http://i.imgur.com/qsrH0e4.png" title="source: imgur.com" /></a>
