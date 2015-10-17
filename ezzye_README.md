Approach is to work through user stories one at a time using BDD.

First a feature test is written on pry.
Also writen in feature'-test file so can be re-run and commented.
Fails.
Then an initial unit test is written on rspec
fails
Then code is written to make pass
then passes
Then more unit tests are done (fails - write code - pass) until each feature test passes.
Then unit test refactored
Then code refactured.
Then move on to new feature.

```
As an air traffic controller
So planes can land safely at my airport
I would like to instruct a plane to land
```

