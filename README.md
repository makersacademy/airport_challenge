
I have completed the challenge with 99% coverage however have been unable to go through the 'rudocop' to fix the violations in my code. 

Missing Rudocop element:: I mismanaged my time over the weekend and focused on the Boris Bike task on saturday in turn not leaving enough time to address this challenge fully. This has been a learning curb for me. 

I would have also liked to put the stormy? method in a Weather file.

———

Firstly I broke down the Users stories into Requirement/ Domain Model. 

———

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport


Airport = instruct plan to land i.e. add the airport instance to be added to a the plane instance - stores plane
Plane class = landing method that assigns an airport 

———

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Airport class = instruct to take off // remove from log
Plane class = take off method removes airport assignment 

——

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Airport class - have max capacity / error when trying to land 

——

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

——

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

—

such as inconsistent states of the system ensuring that 

planes can only take off from airports they are in; 
planes that are already flying cannot take off and/or be in an airport; 
planes that are landed cannot land again and must be in an airport, etc.

———

After breaking down, my approach for the challenge was to address each user story one by one focusing on the specific object. I.E Story 1 - Aiport class > Story 2 > Airport class. 

———