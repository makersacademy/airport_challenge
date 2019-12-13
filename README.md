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

The Challenge
---------
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

* Challenge time: Until 4pm on the same day the challenge was given
* TDD an airport system that contains classes for
    * The airport
    * The plane
    * The air traffic controller
    * The weather


Task
-----


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

The first user story has an "Air Traffic Controller" who needs to ensure passengers get to their location, to do this the ATC will need to instruct a plane to take off amongst other actions a plane can have, these will usually be controlled by the ATC

To meet this story, we will need to create a ATC controller class, this class will be able to send messages to the planes.
We will also need an airport to which the ATC can messages and planes to land at.

We will also be required to create a plane class in order to meet this user story.

```
touch lib/atc.rb will create the air traffic controller class file
touch lib/airport.rb will create the airport class file
touch lib/plane.rb will do the same for the airplane class class file
```

To test against these classes I will need to also create some spec files to which rspec will run tests against the ATC and plane classes

```
touch spec/airport_spec.rb will create the air traffic controller spec file

touch spec/plane_spec.rb will do the same for the airplane spec file
```

With these files in place I will be able to import these to IRB to run TDD tests to further develop the class based on the RGR (Red Green Refactor) feedback loop IRB will provide to direct the code that needs to be written to pass the test

I will not document the entire process for this challange because the git commit history should show this process and for brevity in keeping this README file small

I will however document most of the steps for the first user story.

-----
Getting the plane to land

For my first attempt I have created a true false block to return if a plane was able to land at the airport

```ruby
describe Airport do
  it 'returns true if plan lands' do
    plane = Plane.new
    expect(subject.land_plane).to be true
  end
end
```

My next task will be to get a pass on these tests with as litle code as possible to return the expected TRUE value. As it currently stans, Rspec is complaining it is unable to find the Airport class. This is not suprising at this stage as the class has not been created, albeit the class file does exist.

After creating the Airport class, we are able to pass the initial test and we now get another error, an unitialised constant. It appears rubny does not yet know what a plane is, so it is reporting that

```ruby
Failures:

  1) Airport returns true if plan lands
     Failure/Error: plane = Plane.new

     NameError:
       uninitialized constant Plane
     # ./spec/airport_spec.rb:5:in `block (2 levels) in <top (required)>'
```

To fix this error, we will need to create a new plane class and allow access to this class from within the airport class to so the airport can allow the plane to land

By creating the plane class and allowing the airport class access to this we are now able to move to the next error

```ruby
Failures:

  1) Airport returns true if plan lands
     Failure/Error: expect(subject.land_plane).to be true

     NoMethodError:
       undefined method `land_plane' for #<Airport:0x00007fb35e07dac8>
     # ./spec/airport_spec.rb:6:in `block (2 levels) in <top (required)>'
```

This is telling us that the airport does not yet know how to land a plane so is unable to return the required bool to statisfy this test, to fix this we will need to create a land plane method at the port to return true if a plane was able to land

As expected, the test fails again, this is because while we have a method of landing the plane, the airport is not returning the expected value

```ruby
Failures:

  1) Airport returns true if plan lands
     Failure/Error: expect(subject.land_plane).to be true

       expected true
            got nil
     # ./spec/airport_spec.rb:6:in `block (2 levels) in <top (required)>'
```

To fix this and satisfy the first user story, we will implicityly allow land_plane to return true, we dont need to store the plane or do anything else with it at this stage because the user story specifically asks us to instruct the plane to land without any further requirements for the plane to be stored for later use.

After instructing the airport to return true if the plane has landed, we are now able to pass all of the test.

For the next user story, I will will continue to use this same approch to completing the challange and as I go will refactor the code and tests to be as concise as possible.

------

The second user story asks that an ATC wants to ensure passengers start their journy, to do this, the ATC needs to instruct the plane to take off and confirm that it has indeed left the hanger.

We will need a way to store this plane in the airport, the plane itself will need to have a flag to show if it is docked or in the air. This will also require us to refactor some of the other tests to account for the fact we now need to store planes and pop them from the array once they have left.

------

The third user story asks that if the airport is full, planes will be denied takeoff. For this we will add a test to only allow planes to land if there is space, or reject the landing if at capcity.

The code will need to be refactored to take in to account that we are setting a defult capacity on the airport and that it fould raise an exception if the airport is full. This means we need to keep track of the planes that are docked, and compare this against the capcity and only raise the expception if the plane tries to land.


-----
The fourth user story requires that prevent planes from landing if there is bad weather, we will need a way to create random weather when a plane is docking, we will do this by creating a Weather class and allowing it to randomly decide the current weather. We will start to run in to random test fails at this point due to the random weather, to get around this we may need to look at creating stubs that can stand in for the weather to ensure consitent tests results.

-----

