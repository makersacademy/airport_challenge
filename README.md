My Airport challenge
====================

To complete this challenge I first approached it using the domain model principle.

## Domain model

Firstly I went through each user story one at a time and worked out the required items and their interaction which each other.

### User stories

#### First story
>As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

I wrote my first test to check that a class ```Airport``` existed which obviously <font color="red">failed</font> and then wrote the code to create the ```Airport``` class and ensured that the test then <font color="gree">passed</font>

I then repeated this process for the ```Plane``` class.

I then had to write a test which expected an airport instance to accept and instance of a plane, which firstly <font color="red">failed</font> and then <font color="gree">passed</font> once the was written.

#### Second story
>As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

For this I created a test that checked that the airport instance; no longer held the plane in one of its states; first <font color="red">failing</font> and then <font color="gree">passing</font> once the code was written.

#### Third story
>As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

For this, I wrote a test to check that a class ```Weather``` existed which obviously <font color="red">failed</font> and then wrote the code to create the ```Weather``` class and ensured that the test then <font color="gree">passed</font>

To create the random weather I then created a ```WEATHER_TYPES``` constant with an array like so ```  WEATHER_TYPES = ["Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Stormy"]
``` and then set the initialized state of ```Weather.weather``` to get a random weather ```.sample```.

To then allow the weather to be checked I created a method ```check``` which returned when called a random ```.sample``` weather.

I then created a test to check that a plane would only take off if the ```weather == "Sunny"``` first <font color="red">failing</font> (letting the plane take off regardless) and then <font color="gree">passing</font> once the ```raise``` method was used to halt the process returning a message ```"Cannot take off in stormy weather" ```
 if the ```weather``` returned ```"Stormy"```.


#### Forth story
>As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

The process for this was similar to the previous story where I created a test to check that a plane would only land if the ```weather == "sunny"``` first <font color="red">failing</font>,and then <font color="gree">passing</font> after amending the ```.land``` method to only allow a ```plane``` to ```land``` if the ```weather``` returned ```"Stormy"```, returning an error message of ```"Cannot land planes if the weather is stormy"```


#### Fifth story
>As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

For this I created a test to check for the capacity of an airport, first <font color="red">failing</font> and then <font color="gree">passing</font> once setting an ```Airport``` ```CAPACITY``` state.

#### Sixth story
>As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

For this I created a test to check for the capacity of an airport could be set at initialization of a new instance, first <font color="red">failing</font> and then <font color="gree">passing</font> once changing the ```CAPACITY``` state to be an ```Airport``` ```DEFAULT_CAPACITY``` and setting it using ```Airport.new(n)```.


## Edge cases

>planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

This only required two tests..., one to check that the plane was landed and one to check that is hadn't taken off. I created tests for these asking the land/takeoff methods to check the plane if it had a ```landed``` state, firstly <font color="red">failing</font> and then <font color="gree">passing</font> once I created the state ```landed``` for the ```Plane``` instance, this was defaulted to ```false``` and then was set to ```true``` once landed.

# Conclusion

I believe that I was able to make a valid MVP by creating a suitable amount of tests, and using the most concise code to get these tests to pass. 
