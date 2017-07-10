require '../lib/airport.rb'

# USER STORY
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport = Airport.new(50)
# Default capacity has been set as 10 in the program, but can be overwritten by passing in a single integer argument.
