Airport Challenge step by step
==============================

```
1. As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

I started to create the program from the story that we have.
First step is create a method for airport and one for plane and test them.Then store all the planes in an array called landed.

```
2. As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

On the file of the plane I created :status to check if a particular plane (plane1) is flying or in airport 
#the code work perfeclty till here

```
3. As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

In  airport file I create a fail to check if the ariport is full.

```
4. As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

I create a constant called as 20 on the top of the file ariport that can be easly changed depend of different airport



