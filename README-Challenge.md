Description of the challenge:
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

User stories:
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

Setting up the project:
-git fork
-Make new directory in your projects folder
-Pull all the information from the fork 
-Had to do rvm install “ruby-3.0.2" as I did not have that version of Ruby installed
-Did bundle, which installed the gems, however the first line said “Warning: the running version of Bundler (2.2.22) is older than the version that created the lockfile (2.2.26). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.2.26`. “ , so I followed the instructions and did gem install bundler:2.2.26

