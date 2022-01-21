AIRPORT CHALLENGE 

The motivation behind this creation is to get me familiar with using TDD and will help me self-assess my blockers and how much you have understood the Week 3 Material.

Task
-----
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

After looking at the user stories, I set out a plan to highlight the main test i wanted to run in my spec file based off the client requests.
 
it 'instructs plane to land at an airport' do
it 'instructs plane to take off from an airport' do
it 'prevents landing when airport is full' do
it 'Allow user to set capacity of airport' do
it 'prevents takeoff when weather stormy' do
it 'prevents landing when weather stormy' do

Once I had my initial plan, i worked through each user storie one error at a time using TDD.
I didnt managed to complete the challenge but I got as far as preventing take off/landing when the weather is stormy.
I am happy with where I got to however, I reached similar blockers in Boris-Bikes which is gives me a good idea where I need to direct my learning to. 
