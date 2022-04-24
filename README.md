Airport Challenge
=================

Overview
-------

This is a weekend coding challenge after the first week of a 12 week intensive coding bootcamp at Makers Academy. It is a simulation of code to run airports and planes based around the following user stories:

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

Process
-------

I started this challenge by having a think about how I am going to set myself up and how I am going to approach it. I've forked the repo, and I've set myself up with this README to keep track of my process and the documentation as I go. 

For the first couple of user stories I followed a simple process of reading the story, extracting a simple user expectation, testing it it irb - watch it fail, write a test in rspec, watch it fail, fix the tests until I have a passing test. 

Story 3, together with the edge cases felt a little different. I made a cup of tea and had a break. I felt that this one might need to be broken down into more parts, so I started with some notes and diagramming and then worked from these. 

From this I wrote some new user stories for each of the scenarios it brought up for me - I will test these, and I think consequently I will have fixed the others at the end.

I then realised that design decisions I had made - to hold plane data within airports, not on the planes, might give me issues later in the software. Reflecting on it I came to the conclusion that this was serious enough to start again - so I deleted everything and started again with a new design strategy, following similar steps to above. 

To test the weather cases I created a double that tells the airport that the weather is stormy. 

As I go, if I felt that new test made a previous one redundent, then I removed it. 