# Airport Challenge

## My approch

I enterprited the user story as:
- air traffic controller is user
- as user, controls airport class


To hold multiple planes, it seemed best to use an instant variable array.

I let the order of user storys guide any expanding of the code.
As I didn't finish edge case tests, I didn't add behaver on the plan class to prevent planes from landing when already landed or taking off from a different airport

### A posible solution I would have implemented(when the tests demanded it)

- I would have added behaver to take_off that would set an instance var of the plane class to be 'in flight' and checked that state(before setting ofcourse) to raise_error if that state was not 'landed'.

- I would have then set the behaver of the land method to raise_error if the plan instance is set to 'landed' then set the state to landed(after ofcourse).
