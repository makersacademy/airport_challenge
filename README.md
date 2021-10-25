Airport Challenge
=================

This is a program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Instructions
---------

1. Fork this repo, and clone to your local machine
2. `cd` into the folder
3. Run the command `gem install bundler` (if you don't have bundler already)
4. When the installation completes, run `bundle`
5. Run tests with rspec, result:

![image](https://user-images.githubusercontent.com/75613073/138682651-22587962-8e9a-40eb-a970-245348b2f1c6.png)


User Stories
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
IRB Snippets
-----
