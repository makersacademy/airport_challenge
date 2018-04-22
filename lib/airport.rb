require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, todays_weather)
    raise "It's too dangerous to land!" if todays_weather >= 8
    raise "The airport is full!" if @planes.count == @capacity
    plane.land
    @planes << plane
  end

  def take_off(plane, todays_weather)
    raise "It's too dangerous to take off!" if todays_weather >= 8
    raise "This plane is already flying!" if plane.status == "Flying"
    raise "This plane is in a different airport!" if !@planes.include?(plane)
    @planes.delete(plane)
  end
end
