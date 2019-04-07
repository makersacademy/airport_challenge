# Airport Challenge
A ruby challenge that allows an air traffic controller to land, take off and check where planes are located. To ensure safety planes cannot land or take off when the weather is stormy, or land when the airport is full.

### What I learned
Test-first coding (with Mocks and Test Doubles)
Domain modelling  
Object orientated principles  
Edge cases  

### Approach
The first step was to create a domain model from the 6 user stories.  

Object | Message
------ | -------  
Plane | land <br/> take-off <br/> in_airport?  
Airport | full? <br/> update_capacity  
Weather | stormy?

### Installing
To run this challenge, fork this repo and clone to your local machine.
If after cloning and changing into directory you see a prompt to rvm install a particular version of ruby please follow.
```
$ gem install bundle
$ bundle
```

### Acknowledgments
A Makers Challenge
