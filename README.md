Airport Challenge
=================

The Airport Challenge was the first weekend challenge at Makers Academy. It was designed  to test my capability of following principles of Test Driven Development and Object Orientated Design.

Installation
----------------------
The program runs as a command line application through a Ruby reply such as IRB or Pry.

Clone the repository into a directory on the intended computer and open the reply on the directory. You will need to require lib/airport.rb and lib/plane.rb to use. Alternatively on OSX add an .irbrc file to the home directory with thus line:
```Dir['./lib/*.rb'].each { |f| require f}```
all files in lib directories will then be required automatically.

Running Instructions
-------------------------

There are two classes available to create objects from **Airport** and **Plane**. Instances of these classes can be created.

Airport has query methods capacity and weather which can be called to check on the states of the capacity and weather.

Capacity can be set on creation of instance by passing in number. If argument not provided the capacity defaults to 20.

Weather changes state and can be either sunny or stormy. There is 3/4 chance it will be sunny. If stormy planes will not be allowed to take off or land.

To take off or land planes use the **take_off** and **request_landing** methods on instances of the airport class passing in a plane.

Example
-----------
```
airbus = Plane.new
=> #<Plane:0x007fd1fa924a18 @flying=true>
heathrow = Airport.new
=><Airport:0x007fd1fa8bbd60 @planes=[], @capacity=20>
heathrow.request_landing airbus
 => "landing successful"
heathrow.request_take_off airbus
=> "take_off successful"
```



User Stories:
-------------

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

The stories were worked on in an granular way. Each feature was tested in IRB. If not avaiables an Rspec test was written to duplicate the feature test. Then the required code was written to pass the test.

Domain Model:
-------------

| Class | methods |
|---|---|
| AirPort | request_landing, request_take_off, planes, capacity, weather |
| Plane | land, take_off, flying?, landed?|


This is the classes and main methods that were created with  test driven development from the stories. As the code was refactored more methods  added to add encapsulation and improve readability. They are triggered by the main methods above.

To illustrate how the methods and classes were written on the first part of the user story after testing had created the need for Airport and Plane classes, airports needed to be able to be requested to allow a plane to land. A test was created to test if an instance of the Airport class had a take off method, unit test written and code passed, a test was created to test if when the method request_take_off is passed an instance of Plane it authorises it for take off. Again this test failed, a unit test was written in rspec and code was written to get the test to pass. Each part of the user story was added this way. The key is to design through the tests and write code to pass the tests.

After tests a test had passed I then went through a cycle of refactoring to tidy up the code, remove repetition and give classes and methods single responsibilities.

