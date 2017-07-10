## Things I would fix:

#### General
- Tidy up the indentation - rubocop is shaking its head in disproval at my files at the moment
- add instructions to README :) 

#### airport_spec
- Create a double for plane instead of creating an instance of it for the purposes of the test. I did try to to do this, but as my Plane class has boolean attributes (landed, taken off) and I wasn't sure how to replicate these in a double.
- Defer tests that check the status of the plane to the Plane class. I wanted to include them in the airport class though as I felt in in real life, ATC would want to check the status of a plane by sending a message to them, and the plane would respond.

#### airport.rb
- hide capacity in Private attr_reader

#### weather.rb
- find a more elegant way to randomise the weather sampling?

## Things I like:
- I have guarded against edge cases like making sure the plane is in airport before it departs
- I split the spec tests down into (hopefully) logical context blocks
- plane is able to confirm it's own status by just calling the object
- I previously got really stuck on how to test weather randomisation without the spec randomly failing - and spent a lot of time trying to figure it out, which was very frustrating. Eventually I solve it, and enjoyed the challenge nonetheless.
