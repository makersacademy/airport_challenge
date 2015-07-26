https://travis-ci.org/katylouise/airport_challenge.svg?branch=master

Airport Challenge
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client.

Implementation
---------------

- The project was written in Ruby and RSpec was used for unit testing.  It is a simple command line application.
- Plane and airport classes were created to interact with each other in order for planes to land and take off.  All planes have a status of either landed or flying.
- The airport has a limited capacity, so planes are prevented from landing when the airport is full.
- A weather report is given each time a plane requests to land/take off.  This is randomised but biased towards being sunny.  If the weather report is stormy, planes are prevented from landing or taking off.

Author
--------
Created 26/07/15 by Rebecca Appleyard
