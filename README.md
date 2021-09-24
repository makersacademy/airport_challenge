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


Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

Below, I am outlining the Objects and Messages based on the six user stories that were worked out in collaboration with the client::

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

Starting with the first story, for each story I envision a functional representation, then convert into a domain model.

Objects:	       | Messages:
Air traffic controller | 
Plane	               | land_plane
Airport	               | plane_landed

First User Story Domain Model: https://lucid.app/lucidchart/3190ec96-78a4-4dd4-a292-37f6d7e6a0ad/edit?viewport_loc=237%2C416%2C1210%2C441%2C0_0&invitationId=inv_2c3efc55-5a75-47c1-b4dd-2dc411b18b3c

Once completed, I will then start to feature test and unit test as I go along.

First error message for first feature test:
3.0.2 :001 > airport = Airport.new
(irb):1:in `<main>': uninitialized constant Airport (NameError)
        from /Users/nejlalowe/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/nejlalowe/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/nejlalowe/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :002 > 