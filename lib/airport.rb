require_relative "weather"
class Airport
  attr_accessor :capacity
  AIRPORT_CAPACITY = 30

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity 
  end

  def land_plane(plane)
    fail "You cannot land" if full?
    @planes << plane 
  end 

  def take_off 
    fail "You cannot take off" if stormy?
    @planes.pop
  end 

  private 

  def full?
    @planes.count >= AIRPORT_CAPACITY
  end 

  def stormy?
    todays_weather == 6
  end 

end
