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

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

## my airport

To start the airport challenge I created a class Plane, that will know it's name, and it's location; it is either at an airport, or in the air. When landing, its location will change, as well as when taking off.

Next I created an Airport class, that would see the plane land, know that it would be at the airport, and that would see it leave when taking off. Next I made sure that when the plane decided to land at a certain airport, that that airport would see the plane arrive as well, it would be unfortunate if the airport would miss it, right?

Next I created a max capacity and told my airport not to allow planes to land in case the capacity was reached, nor to allow planes to leave when the airport would be empty.

next I created a weather class, that would randomly pick weather conditions; these conditions are wind, chance of rain, and temperature. I could have added more conditions but those seemed most important to me, to keep it simple. I then created a module that would look at the weather, and decide whether or not it would be safe to fly considering these conditions.

I told my airport class to look at the weather conditions, and if they are deemed unsafe by the module, my airport should not allow for arrivals or departures.

I loved this challenge, so for now this will be my pull request, but considering it is only saturday morning, I think I will add some more fun features! (like a safety breach! )
