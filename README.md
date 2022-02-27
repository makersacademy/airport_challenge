Airport Challenge - Paul Kilgarriff
=================

Approach
---------

* Working from the user stories provided, a list of likely objects and messages was created.
* It was decided that Airport would be the main class that others would interact with.
* RSpec was installed to provide a testing framework
* Using Test-Driven Development, the solution was developed step-by-step in line with the user stories.
* Feature tests were used towards the end of the process once unit tests were passing satisfactorily.
* A Refactoring process was carried out to remove unnecessary comment code and redundant features.

User Guide
-------

### Set Up

Starting in the airport_challenge directory, you will use irb to interact with the class files within the lib sub-directory.

```
cd airport_challenge
irb
> load './lib/airport.rb'
> load './lib/weather.rb'
> load './lib/plane.rb'
```

Running the above commands will give you a screed of errors and warnings - this guide will be updated once a working method of requiring all files within a directory has been found.

### Creating Instances

```
Airport.new("Heathrow")
```

As demonstrated, an instance of an Airport should be initialised with a string representing the name.

```
Plane.new()
Plane.new("Boeing")
Plane.new("Boeing", "747")
```

An instance of a Plane can take between 0 and 2 parameters, representing the make of the plane, and the serial number.
If these are not provided, they will be set to "Unknown" by default.

```
Weather.new()
```

An instance of Weather takes no arguments.

User Stories
-----

Below are the user stories that were provided by the client. The code in its current state satisfies these user stories.

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

Next Steps
-----

The code currently defends against some edge cases, but not others. For example, attempting to take off from an airport will prevented if the airport does no currently contain the specified plane, however there is nothing currently preventing a plane that has already landed from landing again, as the responsibility currently lies with the airport and not the plane.

Along with this, the next steps include:
* Code review from peers to identify avenues for refactoring/rebuilding the classes.
* Further tests to account for edge cases, and subsequent reworking of the code.
* Restructuring the lib folder, or the code itself so that irb can load all files necessary at once.
* Update the documentation for detailed explanation of the instance methods available to each class.
