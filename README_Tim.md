### My approach
I started by using the `respond to` test to check my methods were working. I then attempted to use more precise and varied matchers to ensure the methods were outputting what I expected. 

Test - Green - Refactor

I followed the user stories one-by-one and thought about the *Blackbox* theory. I also used IRB to put myself in the shoes of the user to help me understand the problems more deeply. This also helped me to inform the test that I would write. In all, it just helps me to stick with the narrative!



### This task is incomplete as I have not tested all the possible edge cases

#### Edge case tested:
* If the plane is already parked it may not land

#### Edge cases not tested:
* If the plane is not parked, it may not take off
* If the plane is not flying it may not land

#### Additionals

* I did not complete the test for the weather. I couldn’t figure out in the time I had, how to test for any element of an array to be outputted.
* I have one `rubocop` offence and ran out of time to find out why it didn’t like my use of the `!=` in this context: 

``` 
W: Lint/Void: Operator != used in void context.
      planes != plane

```

