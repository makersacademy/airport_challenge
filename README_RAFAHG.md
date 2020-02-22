# AIRPORT WEEKEND CHALLENGE.

  To implement a solution for this challenge the challege provides me with the following User stories.
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

  I am gonna follow, as advised, a ttd approach to try to obtain a solution to the challenge in a very similar wey the afternoon challenge was presented in its walkthrough.

##STEP ONE.

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

  So based in that fist user story, the client is asking for a system, to manage the flow of landing and taking off for the airport.
  I can idenfify 2 relevants names and one relevant verb : Airport, plane, and land.
  Basing my logic in that nouns represents the objects (Classes), and verbs represent message(methods), i can start now with running a first feature test that could be like that.

  $ irb
  $ airport = Airport.new
  => that is gonna return me a error message due nothing is created. Nor a class neither a method.
  With that in mind i am now going to run the UNIT TEST.
  To run that test i implement the following code in airport_spec.rb

  describe AIRPORT do

   it { is_expected.to respond_to :land }

  end

   If i run that test i will see that there is no initialized constant named AIRPORT, which is pretty fair due there is no file with code at the moment.

   If i implement the code in airport.rb with

   class Airport

   end

   and run a Feature test, i will be able to check that the Feature test responds to
   airport = Airport.new, creating a new instance and putting it in the memory.

    Of course if i run the rspec at this moment it is gonna fail because, again, eventhoug now there is a class Airport, there is not such a method called land.

##  STEP 2

    At this step i am going to implement and commit with the client requirent of the firs story.

    The program is going to instruct a plane to land in the airport.

    To do that i will need a new object, Plane, so a new Class , and implement the actual code a little more.

    First Feature test.

    $ irb
    $ airport = Airport.new
    $ airport.land

    That is going to fail, because as i said in step 1 theres no method yet.

    The unit test is already created and tested with failure.

    At this point i implement the code in airport.rb

    class Airport

      def land

      end

    end

At this point the feature test is failing no more. I have a class and i have a method land.

I need another thing more thoug, an airport without planes would be a lonely place so i need at least one to land.

I define now in plane.rb

class Plane

end

If i pass the feature test in irb with this method.

airport.land(plane), the test will fail, there is no parameter implemented and the land method does not return anything at the moment.

The unit test at the moment is this :

require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

end

If i run rspec i will obtain an error

ailures:

  1) Airport is expected to respond to #land with 1 argument
     Failure/Error: it { is_expected.to respond_to(:land).with(1).argument }
       expected #<Airport:0x00007ffeb196ad68> to respond to :land with 1 argument
     # ./spec/airport_spec.rb:5:in block (2 levels) in <top (required)>'

Finished in 0.01087 seconds (files took 0.13604 seconds to load)
1 example, 1 failure
