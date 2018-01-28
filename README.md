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

I approached this challenge as did in the course, by breaking down the user stories into individual objects and the methods associated they should be responsible for.
Once I had the core of the system in place, I used feature testing in IRB to work out the possible edge cases and add error handling for them where appropriate

Some particular issues that arose

* Testing the value of an instance variable if it is changed by the method but not returned, and there is not a reader method available for it.
> This arose in Airport#take_off. In the end I decided it was reasonable to include attr_reader :planes to allow air traffic controllers to see the list of planes currently landed at the airport, but it is easy to see that there are scenarios where this might not be a solution.

* Best practice for testing that a boolean is returned but not the specific value.

>Currently I am just using ```expect(method_under_test).to eq(true).or eq(false)```

* The difference between including and requiring modules.
>Currently weather.rb is required at the top of the page and the line ```extend weather``` is included at the top of the Airport class, but I am not clear what best practice would be.

* Rubocop says that I do not have coverage of Airport#stormy? But all of the information I could find about testing private methods seemed clumsy.
