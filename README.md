# Airport Challenge

> My approach for this challenge was to keep it simple first off all,
> I used as few classes as possible (e.g. not using a separate class
> for weather), instead assuming that the local weather report would  
> known at the airport ad using a simple rand method to alter the
> probability of stormy weather.

Some terseness may have been lost in plane.rb by creating separate methods within
the Plane class to alter the @flying attribute. However, it seemed best to let the
instance of plane itself be able to read if it was flying or not.

My other concern is the RSpec test "it 'allows planes to land and take off except in
stormy weather' " which may contain too many separate tests. This was due to trying to
avoid too much repetition of setting stormy? to true or false, but I'm not sure if it
would be considered bad practice or how to better remedy the issue for DRY code. I
have added notes to clarify which user stories are being tested.
