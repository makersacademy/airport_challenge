# Airport Traffic Control System

This program is designed to manage Planes flying in and out of an airport. The airport has been created through the guidance of the user stories provided:

> As an air traffic controller,\
So I can get passengers to a destination,\
I want to instruct a plane to land at an airport.

> As an air traffic controller,\
So I can get passengers on the way to their destination,\
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.

> As an air traffic controller,\
To ensure safety,\
I want to prevent landing when the airport is full.

> As the system designer,\
So that the software can be used for many different airports,\
I would like a default airport capacity that can be overridden as appropriate.

> As an air traffic controller,\
To ensure safety,\
I want to prevent takeoff when weather is stormy.

> As an air traffic controller,\
To ensure safety,\
I want to prevent landing when weather is stormy.

The idea of this program is to track flights landing and taking off from the airport. The code also takes in account for edge cases. For example, if a plane is currently landed in the airport, you cannot use the `.land` method on the same plane, since it is already landed within that same airport.

This system was built using the following [TDD](https://en.wikipedia.org/wiki/Test-driven_development#:~:text=Test%2Ddriven%20development%20(TDD),software%20against%20all%20test%20cases.) steps:
1. Get User Requirements and understand them.\
I also break down the user requirements to see what it is we are asking the program to do. For example, the first user requirement:
    > As an air traffic controller,\
So I can get passengers to a destination,\
I want to instruct a plane to land at an airport.

    can have the required information extracted from it. Like so:
    
    | User Story  | Code To Implement |
    | :-------------: |:-------------:|
    | Instruct a plane to land at Airport | `Airport.land(plane)` |
    
    This table helps us identify the end goal of the test we need to make. When we start with an empty file, we'll know that we'll need an `Airport` class right from the get-go from looking at that table.
2. Run a feature test in IRB - Write the code you wish you could write depending on the user requirements.
Going with the example above, since we now know we need an `Airport` class, we can hop into `irb` and make a new instance of the Airport class:
            3.0.2 :001 > airport = Airport.new
            (irb):1:in <main>': uninitialized constant Airport (NameError)

3. Watch the feature test fail - this is normal since we haven't written any code.
4. Write a unit test in Rspec **to encapsulate that same error message received in the feature test.**
In our `airport_spec.rb` file, we can write:
```
    require "./lib/aiport.rb"
    describe Airport do
        it "can make a new instance of Airport class" do
            expect(Airport.new).to be_an_instance_of(Airport)
  end
```

5. Write the smallest amount of code to make that test pass.
In our `airport.rb` file, we can write:
```
    class Airport
    end
```
6. Run `Rspec` to see if the code passses:
```
    1 examples, 0 failures
```
7. Repeat! You can also run `airport.rb` in `IRB` to visualise why your code works.

## Installation
Fork or download this repo.
Use `gem install bundler` to install the correct gems to use and test this code.

## How To Use
Create a new airport using `airport = Airport.new`.\
Create a plane using `plane = Plane.new`\
Land a plane using `airport.land(plane)` to store it inside the Airport.\
To have a plane take off from the Airport, use `airport.take_off(plane)`.

There are times where the weather can be stormy. If so, the `land` and `take_off` will be suspended as it is not safe to fly out in such weather conditions.

## How To Test
Run `rspec` to run through tests.

## Bugs/Future Changes To The Code
* The weather is currently hard-coded, I will update it to be random and automatic within the code.
* Planes cannot take off without being landed first, (by calling the `.land` method). There will be a change to fix this so once the plane is made, it is added to the airport by default. For now, please use `.land(plane)` to land the plane, and then you can have it take off.