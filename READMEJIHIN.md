### Understanding user story, domain modelling:

Verbs (actions):
land plane -
take off plane -
confirm plane not at airport -
stop plane take off if stormy
stop plane land if stormy
stop plane land if full
change airport capacity

Nouns(identify objects):
air traffic controller (does most of the controls)
plane
airport (has airport capacity)
passengers (not really anything mentioning passengers getting on and off the plane)
system designer (he wants to be able to change airport capacity)
weather (stormy or clear)
airport capacity (full or not)
destination (different instances of the airport class)


Objects  |   Messages
-------------------- | --------------------
plane | land, takeoff, ?confirm plane has left airport?
airport | ?confirm plane has left airport?, stop takeoff/land if stormy, stop land if full capacity, change capacity, passengers
weather | rand(stormy, clear)
air traffic controller |
system designer |


### Writing the first test
