#### airport_challenge

## approach
The main difficulty with this exercise was in how the airport and planes would 
speak to one another to change or know the plane's status. The solution that 
became apparent from trying to devise rspec tests was to have the airport call a
method on the plane, which in turn allowed it to change its own status if the 
take_off or landing was successful.

## difficulties and improvements
One area of improvement seems to be the class-method weather perhaps should not 
be a class-method. I wanted to have the ability to generate a random weather 
each time a plane attempted to land or take_off, rather than at the class level.
This caused problems with stubbing the weather. For instance using an instance 
method:
```
allow(:airport).to receive(stormy?) {true}
```
would not work, but using a class method would:
```
allow(Airport).to receive(stormy?) {true}
```
Lastly the suite of tests might not be the most optimal as there are some let 
and before blocks that are not used across multiple tests. However the decision 
was to leave these as is for the sake of practicing doubles and stubs.
