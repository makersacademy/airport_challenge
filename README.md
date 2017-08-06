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

Approach to solving the challenge
---------
This challenge required me to use knowledge of classes gained in week one of the Makers Academy course. As an RSpec novice, I had to adjust to writing tests before developing code to pass them, which is a lesson still in the process of being learnt!
 
Difficulties
---------
I knew that this challenge would involve two principal difficulties, which were RSpec's 'doubles' and class-to-class interaction.

1. RSpec 'doubles'

   Doubles have been a difficult concept to grasp since learning about them earlier in the week. Of particular difficulty was learning how to make a particular instance of a double change its behaviour within a specific test in case multiple instances were required. 

2. Class-to-class interaction

   When completing the airport class in particular, a lot of thought had to be committed to working out how it would interact with both the plane and weather class. Problems emerged when trying to initiate new instances of the weather class within the airport initializer (as I thought at one point I needed this to occur), and this subsequently led to more impossible problems in my spec files. However, this actually led to substantial refactoring of my classes, which ultimately led to clearer, more efficient methods.

Learning points
---------

  * Feature tests require capybara!
  * KISS
  * Remember when to make methods private
  * Methods are not always better if they are shorter. Remember clarity!
  * Keep your spec files neat, so that anyone can read what your program does