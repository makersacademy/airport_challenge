require 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :planes, :sunny

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    weather_condition = Weather.new
    @weather = weather_condition.sunny
  end

  def land(plane)
    fail "Airport is full" if planes.length >= capacity
    fail "Weather stormy: cannot land" unless sunny
    fail "Plane has already landed" if plane.landed

    plane.landed = true
    planes << plane
  end

  def take_off(plane)
    fail "Weather stormy: cannot take-off" unless sunny
    fail "Plane is has already taken-off" unless plane.landed
    fail "Plane is not at this airport" unless planes.include? plane

    plane.landed = false
    planes.pop
  end

end
