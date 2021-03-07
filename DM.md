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
The I
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

Objects       |    Messages

plane         | land yes
                take off yes
                no longer at airport? yes
                don't land if airport full
                don't take off if weather is stormy
                don't land if weather is stormy

                Further Edge cases
                Write an RSPEC feature test that lands and takes off a number of planes_at_airport
                The code is elegant: every class has a clear responsibility, methods are short etc.
