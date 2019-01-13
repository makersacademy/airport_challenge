Airport Challenge (Makers week 1)
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

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

User stories
-----

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```


Approach
------
The task was to test drive the creation of this program to satisfy the above user stories.

I started by mapping out the classes and methods needed based on the user stories and I used the [Boris Bike project](https://github.com/user/repo/blob/branch/other_file.md) that we've been working on this week as help. 
While writing the tests and implementing solutions, I followed the TDD decision tree diagram process.

I implemented the easier features to start with:
* instruct plane to land at airport
* instruct plane to take off from an airport
* prevent landing when airport is full
* airports to have default capacity which can be overriden

I left the problems relating to stormy weather last.

I don't quite understand doubles and stubs yet, and I suspect that my tests are not true to life - further work required on the weather related behaviour on both the tests and the implementation.
