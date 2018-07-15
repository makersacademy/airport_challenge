# Airport Challenge

### Completed by Marek Schmidt
#### Instructions below

## Approach
I decided to use IRB as a method for feature testing this program. I did not want to create an interactive menu or a file that runs by itself. I only created two classes, one for airports and one for planes. The user acts as an air traffic controller, instructing planes to take off or land at airports. The random chances of bad weather are randomly decided any time a plane attempts to either land or take off from an airport. The user, as an air traffic controller, will receive a warning of poor weather and will therefore not be able complete the action on that attempt as it is unsafe. The user may also create airports and planes at will.

## State of project and changes to be made
I added quite a bit of unnecessary features, mainly to promote better usability. For instance, the land and take off methods exist on both classes, so the program has more flexibility and 'intuitive-ness' to the user.

Currently I have only one instance of rubocop finding an offense, which is a method that is 11 lines long, 1 over the limit of 10. This method (take_off_by_name) is a method I wanted to have because it adds to ease-of-use. The entire naming of planes and airports were unnecessary, in fact, though I thought it was a nice feature to add.

There are a few additions that can be made, but I believe I've already gone beyond the expected functionality of the program so I have left them out as of now. Most of these additions would come in the form of raised errors when trying to make an invalid method call.

## Feature testing
Instructions on how to use this program are included below. These instructions act as a very short feature test if followed, however the full functionality of the program is not entirely explored by solely copy-and-paste-ing.

## How to use

#### 1. Run IRB
```
irb
```

#### 2. Require the proper files
```
require './lib/airport'
```
```
require './lib/plane'
```

#### 3. Set up at least one airport  
  * Optional name and capacity parameters can be passed
  ```
  gatwick = Airport.new('Gatwick', 30)
  ```
  * If no parameters are passed, the name will default to 'airport' and the capacity will default to 20
  ```
  my_airport = Airport.new
  ```  

#### 4. Airplanes can also be named by passing the name as an optional parameter
  ```
  boeing = Plane.new("Boeing 747")
  ```  
  * If no name is passed, the name will default to 'airplane'
  ```
  my_plane = Plane.new
  ```

#### 5. There are two ways to land a plane  
  * Call the land method on an airport and pass the plane as an argument
  ```
  gatwick.land(my_plane)
  ```
  * Call the land method on a plane and pass the airport as an argument
  ```
  boeing.land(gatwick)
  ```

#### 6. There are three ways to make a plane take off  
  * Call the take_off method on a plane object by it's name in memory
  ```
  my_plane.take_off
  ```  
  * Call the take_off method on an airport and pass a plane object by it's name in memory
  ```
  gatwick.take_off(boeing)
  ```
  * Call the take_off_by_name method on an airport and pass a plane's assigned name as a string
  ```
  gatwick.take_off_by_name("Boeing 747")
  ```
  * _This third method is useful when many planes were landed at once but never assigned to a name in memory, such as with_ `10.times {gatwick.land(Plane.new)}`  
  * _In this case,_ `gatwick.take_off_by_name('airplane')` _will remove one plane from Gatwick_

#### 7. There are two ways to check a plane's current airport  
  * Call the airport method to receive the airport as an object
  ```
  boeing.airport
  ```  
  * Call the airport_name method to receive just the airport's name (if it has one)
  ```
  boeing.airport_name
  ```  
  * _When a plane is in the air, it's airport will be **nil**_  

#### 8. There are two ways to check an airport's current list of planes  
  * Call the planes method to get a long array of all plane objects
  ```
  gatwick.planes
  ```  
  * Call the planes_by_name method to print a string containing the names of all planes currently at the airport
  ```
  gatwick.planes_by_name
  ```

#### Each time a plane attempts to either take off or land at an airport, there is a 10% chance that the weather will be too stormy to safely allow the action, and an error will be given

#### If an airport is at capacity, an error will be given when attempting to land an additional plane

## User Stories:
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
