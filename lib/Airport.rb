require_relative 'Plane.rb'

class Airport

  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather= Weather.new
  end

  def land(plane)
    #fail "Unable to land due to storms!" if stormy?
    fail "Airport is full" if full?
    plane.ground
    self.planes. << plane
  end

  def takeoff(plane)
    #fail "Unable to takeoff due to storms!" if stormy?
    index = planes.find_index { |airplane| airplane = plane }
    fail "This plane is not here" if index == nil
    plane.fly
    planes[index]
    planes.delete_at(index)
  end

  def stormy?
    weather.current_weather == "stormy"
  end

private

  def full?
    self.planes.length == DEFAULT_CAPACITY
  end

end
