require 'weather'

class Airport

  attr_reader :planes, :capacity, :weather

  def initialize(capacity=3)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    @weather = Weather.stormy?
    raise 'It is too stormy' if @weather == 'stormy'
    raise 'Plane already landed' unless plane.location == 'airborne'
    raise 'The airport is full.' unless @planes.length < @capacity
    @planes << plane
    plane.location = self
  end

  def take_off(plane)
    @weather = Weather.stormy?
    raise 'You are not at this airport' unless @planes.include? plane
    raise 'It is too stormy' if @weather == 'stormy'
    plane.location = 'airborne'
    @planes.delete(plane)
  end

  def weather
    rand < 0.10 ? 'stormy' : 'sunny'
  end

end