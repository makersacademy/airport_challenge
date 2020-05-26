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

**My Approach**
-----

1. Fork the repo and clone to my local machine
2. Run `gem install bundle`
3. When the installation is complete, run `bundle`
4. Map out domain model
5. Initialise RSpec `rspec --init`
6. Create necessary directories and files
        - `lib`
        - `airport.rb` `airport_spec.rb`
        - `plane.rb` `plane_spec.rb`
        _ `weather.rb` `weather_spec.rb`
7. Begin testing first user story

**Domain Model Diagrams**
-----

![Responsibilities](https://github.com/Sumner1185/airport_challenge/blob/master/Responsibility_Table.png)
![Class Diagram](https://github.com/Sumner1185/airport_challenge/blob/master/Class_Diagram.png)
![Example Flow](https://github.com/Sumner1185/airport_challenge/blob/master/Expected_Flow.png)

The diagrams above show my approach to this exercise in terms of class structure and how I expect that objects will communicate with one another.
