require 'plane.rb'

class Airport
  AirportCapacity = 50

  attr_accessor :plane
  attr_accessor :capacity

  def initialize(capacity = AirportCapacity)
    @capacity = capacity
    @planes = []
  end

  def land
    @plane = Plane.new
  end

  def take_off
    @plane = 0
  end

  def full?
    @planes.count >= @capacity
  end

end
