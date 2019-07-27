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

Instructions
---------

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
