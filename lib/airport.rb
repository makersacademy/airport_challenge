require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, todays_weather)
    raise "It's too dangerous to land!" if todays_weather >= 8
    raise "The airport is full!" if @planes.count == 1
    @planes << plane
  end

  def take_off(todays_weather)
    raise "It's too dangerous to take off!" if todays_weather >= 8
    @planes.pop
  end
end
