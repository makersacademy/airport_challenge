# Airpoirt Challenge - Week 1
### Makers Sept2021

I began the challenge and initially got stuck on the third user story, because I had run a fairly poor irb feature test for the second user story, which meant that the third user story appeared to require a huge leap in coding that made it confusing in how to correctly and progressivley apply TDD. 

After a little nudge from Anthony I retraced my feature test and got unstuck. 

### HOWEVER... 

Influenced by the Boris Bikes challenge I built the code so that airports generate planes and make planes land or take off etc. 
By the time I satisfied all user stories and rspec tests, I realised that this was weird and even sounded strange to say that airport.take_off(plane) and it should be the other way around.

So I re-did the code based on the following user story table:

| Objects         | Messages     | 
| --------        | --------     |
| User            |              |
| Plane           | land         |
|                 | take_off     |
| airport         | full         | 


To deal with edge cases I added an attribute to plaane that stores whether it is on the ground or in the sky. I assumed that at some point it may be interesting to change that to the actual airport, so one can track which planes are where.

I believe there is a way of slimming down the code by taking the error messages elsewhere.

I kept all rpsec tests in one file, but they really need a lot of refactoring, to make them a bit more concise, which I don't have time for at the moment.