require_relative '../lib/Plane.rb'


class Airport
DEFAULT_CAPACITY = 5


attr_reader :plane #Not sure if needed

def initialize(capacity = DEFAULT_CAPACITY) #can be changed at will
@hanger = []
@capacity = capacity
end


def plane_land(plane) # I want to instruct a plane to land at an airport (DONE) and confirm that it has landed
raise 'Cannot land plane due to weather' if stormy? # I want to prevent landing when weather is stormy
   @hanger << plane
 end


def plane_launch(plane)
   @hanger.pop #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 end


private #private method can only be seen inside of
def stormy?
   true if rand(1..10) > 7
 else false #might be superflous
 end


private
 def sunny?
   true if rand(1..10) <= 7
 else false #might be superflous
 end

private
 def full?
   @hanger.length =< DEFAULT_CAPACITY
 end

private
 def notfull?
   @hanger.length < 1 #Rework
end
end

#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
