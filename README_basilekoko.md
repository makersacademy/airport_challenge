[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

# The Airport challenge:

My approach to solve this challenge is to create 3 different classes to
handle different aspects of the user story requirements:

1. **Airport class** that will handle the decision to allow a plane to land or take off. I will create 3 methods in this class. Please note that a new instance of this class have to be instantiated with a default capacity value and a Weather class instance  

- A method landed  
This method will rely on the output of a method called land in the class Plane to confirm that a plane has landed.

- A method off_airport
This method will rely on the output of a method called take_off in the class Plane to confirm that a planed took off and is no longer at the airport.

- A method full? which will compare the variable @planes that contains the number of planes currently at the airport with the default capacity of the airport held in a constant called DEFAULT_CAPACITY. If @planes is greater than DEFAULT_CAPACITY this method will raise an error, otherwise it won't do anything.  


2. **Plane class** which is responsible for landing and taking off plane. This class will have 2 methods. land and take_off. The method land will report to the method landed in the airport class so that it can add a plane instance to Airport @planes variable, and the method take_off will report to the method off_airport in Airport class so that it can remove a plane instance from the variable @planes.  

3. **Weather class**, which will generate the weather condition randomly every time an instance of this class is  created. Two methods will be created under this class, a private method weather and normal one called stormy? The method weather is going to return a random value of an array that contains the weather condition stored as symbols. When the method weather is called it is going to the generated data to the method stormy? The method stormy returns true if the value it receives is :stormy and false if the value is :clear.
