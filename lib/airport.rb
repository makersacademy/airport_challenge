require_relative 'plane'

class Airport 
DEFAULT_CAPACITY = 17
attr_accessor :capacity, :plane, :planes_in_the_airport, :stormy
 # User story 4 : archtect can override the default capacity 
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_the_airport = []
  end

  # User story 1 : the controller can instruct planes to land
  # User story 3 : prevent landing when capacity has reached
  def land(plane)
    fail 'The airport has reached landing capacity' if @planes_in_the_airport.length >= @capacity
    fail 'Cannot land when weather is stormy' if stormy?
    @planes_in_the_airport << plane
    @plane = plane
  end 

  # User story 2 : the controller can instruct planes to take off and confirm it is taken off
  def take_off
    fail 'Cannot take off when weather is stormy' if stormy?
    @planes_in_the_airport.pop
  end 
  
  # User story 5 & 6 : prevent landing and taking off when stormy
  # Using random number generator to assign a random number to weather
  # in this case there is 5% (1/20) of the chance to be stormy, whick will prevent landing and taking off
  def stormy?
    weather = rand(1..20)
    if weather == 17
      @stormy = true
    else
      @sunny = false
    end 
  end 
#   def take_off(plane)
#     raise 'This plane has taken off' unless @airport.include?(plane)
#     @airport.delete(plane)
#   end 
end 