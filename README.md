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

* Challenge time: rest of the day and weekend, until Monday 9am
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

I tried to follow the steps that I had been taught over the first week. Instead of rushing in and doing what I assume the project wants. I read each step and slowly built up my code accordingly. Doing feature tests for each step, then applying what I had learned from these steps to a unit test then my code.

Once I had code and tests that I was happy with, I went back and tried to refactor everything to improve the overall look. Whilst doing this I did encounter a number of small issues that made my code stop preforming the way I expected. 

## using the code

This code was designed so that an you first set up an airport, this can be done with the default value of 10 or with a value of your choice

```
Heathrow = Airport.new
Gatwick = Airport.new(50)

```
From here, you would set up the plane

```
Plane1 = Plane.new
```

There are two of different methods you can call on the airport involving the plane. 

```
Heathrow.land(plane1)
Heathrow.take_off(plane1)
```

Planes can only take off if they already exist in the airport and can only land if they are currently in the air. 

The last thing to note is the weather. There is a chance that it will be stormy, if so planes can’t take off or land.

