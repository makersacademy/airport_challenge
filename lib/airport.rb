require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hanger, :weather, :weather_conditions

  def initialize(capacity=20, weather = Weather.new)
    @hanger = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is already full of planes!" if full?
    raise "It's crazy down there, we can't land!" if weather.stormy_for_sure?
    @hanger << plane
  end

  def take_off(plane)
    if weather.stormy_for_sure?
      raise "We can't take off, it's blowin a gale!"
    else
      @hanger.delete(plane)
      @hanger
    end
  end

  def full?
    @hanger.size >= @capacity
  end

  def stormy_for_sure?
    true
  end

end
