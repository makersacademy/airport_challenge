# Airport Challenge
A ruby challenge that allows an air traffic controller to land, take off and check where planes are located. To ensure safety planes cannot land or take off when the weather is stormy, or land when the airport is full.

### What I learned
Test-first coding (with Mocks and stubs)  
Domain modelling  
Object orientated and single responsibility principles  
Edge case guards    

### Approach
The domain model I created from the 6 user stories.  

Object | Message
------ | -------  
Plane | land <br/> take_off <br/> in_airport?  
Airport | full? <br/> stormy?  
Weather |

Development followed a feature to unit test cycle, where I would imagine how the program would be used via `irb` and created unit tests that mirrored errors generated from the feature test.

### Installing
To run this challenge, fork this repo and clone to your local machine.
If after cloning and changing into directory you see a prompt to rvm install a particular version of ruby please follow.
```
$ gem install bundle
$ bundle
```

### Acknowledgments
A Makers Challenge
