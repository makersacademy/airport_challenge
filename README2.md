## approach

I tried to take it step by step: taking the user stories through the TDD process.

I made the decision to have the Plane class deal with land and take_off methods, as an air traffic controller would instruct planes like this. I could make a similar case for the Airport class but this marginally won out.

I was initially going to make weather a separate class however it has state but no behaviour. Also for all intents and purposes, the weather at an airport determines whether planes should land and take off from an airport.
