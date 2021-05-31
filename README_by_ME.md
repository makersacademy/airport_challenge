# Airport Challenge

## Description

This challenged forced me to learn the use of doubles and stubs in order to ensure the passing of all tests as more features and special circumstances were added to the codebase.

Initially, I created three different classses: Plane, Airport and Weather. As I continued crafting tests and methods I realized that it would better suit the code if weather became a method, rather than a class. After trial and error I decided to include this method in the Plane class rather than the Airport one, since the methods land_at and take_off belonged to the Plane class, and were the ones that would need to know if the weather was OK to carry on with their goals.

## User Stories

For these user story, I created tests that would evaluate if:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

```

1. Instances of both the Plane and Airport Classes would be created respectively.
2. A plane would respond_to the method land_at.

- The land_at method takes one argument, the name of the object of the Airport Class where the plane is intended to land.
- I added this method to the Plane Class since it is this object the one carrying on with the action described.

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

3. The take_off method checks for the status of the plane:

- landed: when a Plane uses the previous method, it changes the the status of the plane to 'landed'
- flying: when a Plane uses the take_off method, its status will change to flying.

4. My test for this user story checks for the status of the plane, after it has landed successfully on an airport, and then taken off it.

- The status can be checked directly by using the instance variable with an attr_reader.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

5. I used a double of an airport object that would be full by default. This way, my test would check if the appropriate error would be raised when trying to land at a full airport.

- A full method was created for the Airport Class. It compares the amount of planes stored in the variable @planes vs the CAPACITY (50) of the airport.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

6. All airports have an instance variable within their Initialize method that has a default value pointing at a constant variable CAPACITY equal to 50. This works allong the attr_accessor that allows to read and overwrite it.

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

7. A weather_ok? method was created withing the Plane Class. It stores withing the @ok_to_fly variable if the weather is 'clear' or 'stormy'. To accomplish this, I used rand(10) to create a random number between 0 to 10. If this number is not 9, it delivers true, otherwise, false.

8. I called upon this method within my take_off method.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

9. I repeated the same process for my land_at method.

10. It's worth noting that I had to ensure the right conditions would meet for each test. Meaning, if I needed to land an airplane, I had to program the test to always give weather_ok? to be true. If I needed it not to let the plane land, I would have to program it to always be false.

11. I added additional methods such as:

- garage: it is used within the land_at method on the Plane class to let the airport know that a plane has landed and to count it.
- au_revoir: whenever an airplane uses the take_off method. It uses the @airport variable with the attr_accessor in order to notify the airport object to substract one plane from its count.

## How to Use?

This app can be used in the Terminal with IRB.

After opening IRB, within the directory use "require './lib/plane.rb'

Afterwards, create instances of the Plane and Airport classess. Later, use the methods land_at(name_of_the_airport) and the take_off method. Once in a while, you will get an error if the weather is not OK. Also, if you store 50 planes, you will raise an error as well.
