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

This program will control the flow of planes at an airport:
- Land and store a plane in an airport if the hangar is not full.
- Allow a plane to take off from the airport, as long as there are planes in the hangar.
- Check if a plane has departed.
- Change the default capacity of the hangar if required.
- Prevent takeoff and landing if weather is stormy.

Installation
-----

1. Fork this repository.
2. Clone your new forked repository using `git clone` followed by your fork URL.
3. Move into the repository by using `cd airport_challenge`.
4. Run the command `gem install bundler` (if you don't have bundler already).
5. When the installation completes, run `bundle`.


Program Usage
-----

Use irb to run the program from the main repository:

```zsh
irb -r './lib/airport.rb'
```


Test Usage
-----

Use rspec to run the tests from the main repository:

```zsh
rspec
```


User Stories
-----

The client requests are broken down as follows:

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