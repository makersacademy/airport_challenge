Sunday 30/06/2019

 1st Week End Challenge

In the relative file I would to explain how did I approach to solve the Challenge.

The first step it was to create two classes: 1 Airport
                                             2 Plane

After I started to define methods in the Airport class, starting with:

- take_off
- land
- random_weather
- full?
- initialize
- plane_status

The next step I create an array in the random_weather with .sample method to make a random weather

In #take_off method I wrote a statement which if the weather was "stormy" the plane couldn't fly if not cancel a plane from the @plane_list.

In #land method I did the same thing of the #take_off method, I wrote a statement that the plane wasn't able to fly cause of the "stormy" weather and if was full the airport, if not the add a plane in the @plane_list.

In #full? method I created a statement if the @plane_list was full

In initialize I passed the capacity as argument, created a @plane_list array.

In #plane_status method I would like to do a refactoring job writing a statement for the plane which if was "flying" giving a message that was flying and if was landed return a message as error which says the plane was already in the airport.

Once I have done the Airport class I moved to the Plane class to give a a behaviour if was #flying? setting with true and false.

In the end I wrote the tests for each method of the Airport class.
I used a "mock" syntax to make tests on the weather and see if the plane was able to fly.

IMPORTANT NOTES!!!

Negative notes:

- My code could be better written, more readable and would like to do some refactoring job.
- The weather could be a class instead of method.
- I am still struggling with the RSpec syntax and sometimes I feel not to be on the track.
- I couldn't write a module because I didn't finish step 21.
- I am still feel very clumsy and not very fast to formulate my thoughts.
- I would like to be able to describe and explain better what I am doing.

Positive notes:

- I found the week end challenge as a very nice practice to resume what I learn during the week, so I can track all my weaknesses and my strong point.
- Even if I still feel not very confident I have realised that this is what all I learnt during my first week in Makers, which is good, is better be calm and do one thing very nice instead of doing 100 bad.
- I realised that I need to be more focused and enjoy if I get a bug to solve, because is going to be most of the time that I have to solve a bug instead that I have a program running properly.
- I noticed that I have to track in a paper whatever I want to modify to avoid that I am going to forget what I was doing.
- So far I need to be positive even if I am a very moody person and keep up with a good attitude for the next 11 weeks.
