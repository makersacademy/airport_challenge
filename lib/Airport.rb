require_relative 'plane'

class Airport
  attr_reader :landed_planes, :weather_condition

  def initialize
    @landed_planes = []
    @weather_condition = rand(1..5)
  end

  def instruct_to_land(plane)
    fail "No planes can land as it is stormy" if is_stormy?
    fail "The plane is already in the airport" if plane.in_airport?
    landed_planes << plane
    plane.land
  end

  def instruct_take_off
    fail "No planes can take off as it is stormy" if is_stormy?
    fail "There are no planes in the airport" if @landed_planes == []
    plane = @landed_planes.pop
    plane.take_off
  end

  def weather
    @weather_condition = rand(1..5)
  end

  def is_stormy?
    @weather_condition == 5 ? true : false
  end

end
