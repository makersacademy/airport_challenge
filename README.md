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
-----
In order to build this program I followed the following steps:
* Break down each user story into its objects and messages by separting out the nouns and verbs
* Perform a manual feature test to work out how I would expect that part of the program to work e.g
* From the feature test I built a failing unit test
* Write code to make the test pass
* Feature test to check it works as expected
* I repeated this process for each user story - sometimes I would tweak the code and tests if I changed the way the program would work.

**Example User Story**
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
| Objects    | Nouns     | 
| ---------- |---------- |
| Airport    | take_off  |
| Plane      |           | 

**Example of Imagined program**
```
> airport = Airport.new
> plane = Plane.new
> airport.land(plane)
```
**Example Feature Test**
```
> airport = Airport.new
=> Traceback (most recent call last):
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Airport)
```

How this program works
-----

This program is run from the command line using irb:
```
irb -r './lib/airport.rb'
> airport = Airport.new
=> #<Airport:0x00007fdda59aa4e0 @planes=[], @capacity=15> 
> plane = Plane.new
=> #<Plane:0x00007fdda59a1b10>
```

**Users are able to instruct planes to land at an airport**
```
> airport.land(plane)
=> [#<Plane:0x00007fdda59a1b10>] 
> plane_two = Plane.new
=> #<Plane:0x00007fdda59909a0>
> airport.land(plane_two)
```

**The program has a random weather generator that will prevent planes from landing or taking off in stormy weather**
```
> airport.land(plane_two)
Traceback (most recent call last):
        3: from /Users/student/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from ../lib/airport.rb:13:in `land'
RuntimeError (The plane is unable to land)

```

**Users are able to instruct planes to take off from an airport and receive a confirmation message**
```
> airport.take_off
=> "The plane has taken off" 
```

**Users are able to set a default capacity and will get an error message if the number of planes that land exceeds the capacity**
```
2.5.0 :002 > airport = Airport.new(20)
 => #<Airport:0x00007feb9217d290 @planes=[], @capacity=20>
```

Issues/ further developement
-----
**This program does not defend against the following edge cases:**
* Ensuring that planes can only take off from airports they are in
* Planes that are already flying cannot takes off and/or be in an airport
* Planes that are landed cannot land again and must be in an airport

**Need to add a test for land method that checks if the plane has been added to the planes array**

**Awaiting an RSpec *feature* test that lands and takes off a number of planes**

Topics covered
-----
* TDD
* Encapsulation
* Guard clauses
* Single-responsibility principle
* Stubs and doubles using RSpec

Resources used
-----
**[Relishapp: Mocks](https://relishapp.com/rspec/rspec-mocks/docs)**

**[Youtube: How to Use RSpec Mocks & Stubs](https://www.youtube.com/watch?v=oyMPzA-ZWkE)**

**[Better Specs: RSpec Best Practice Guide](http://www.betterspecs.org)**

**Boris Bike Challenge**
