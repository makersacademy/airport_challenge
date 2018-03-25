require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hanger, :weather, :weather_conditions

  def initialize(capacity=20)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport is already full of planes!" if full?
    #raise "It's crazy down there, we can't land!" if weather.stormy?
    @hanger << plane
  end

  def take_off(plane)
    raise "We can't take off, it's blowin a gale!" if weather.stormy?
    @hanger.delete(plane)
    @hanger
  end

  def full?
    @hanger.size >= @capacity
  end

end
