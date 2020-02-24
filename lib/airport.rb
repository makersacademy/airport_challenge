require_relative 'plane'
require_relative 'weather'

class Airport 

  attr_reader :hanger, :capacity, :weather
  
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end
  
  def land(plane)
    raise "Airport full" if full?
    raise "It's too stormy to land" if @weather.stormy?

    plane.flying? ? (@hanger << plane; plane.landed) : "Plane is already in the hanger"
  end

  def takeoff(plane)
    raise "It's too stormy to take off" if @weather.stormy?
    raise "Plane is already flying" unless plane.landed
    raise "The hanger is empty" if @hanger.empty?

    @hanger.pop.flying && "A plane has left the airport"
  end

  private

  def full?
    @hanger.length >= @capacity
  end
  
end
