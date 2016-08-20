# README
Taken together these files constitute a fully tested airport model.

## Install Instruction

To install these files from Github:
1 - Fork this repo, and clone to your local machine.
2 - Run the command gem install bundle (if you don't have bundle already) from the cloned file location.
3 - When the installation completes, run bundle install.
4 - Run IRB -r ./airport.rb

## Approach to Solution

My approach to this project was heavily influenced from the Boris Bikes Project (https://github.com/TomStuart92/boris-bikes).

I have focused on ensuring minimal dependencies between my classes.
This was done using dependency injection, and limiting the number of public methods.

## Usage Instructions
To create a new Plane 'plane = Plane.new'
To create a new airport 'airport = Airport.new' (Creates Airport using Default Weather Class)

Then planes can be landed and take off:
'airport.land(plane)'
'airport.takeoff(plane)'

Land and takeoff are contingent on good weather, and the plane being in the correct state.
For example a plane cannot land if it has already landed at another airport.

### Author Details
Created by Tom Stuart
www.github.com/tomstuart92
