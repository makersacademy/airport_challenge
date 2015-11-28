require_relative 'plane'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def instruct_to_land(plane)
    raise "The plane is already in the airport" if plane.in_airport_status == true
    landed_planes << plane
    plane.land
  end

  def instruct_take_off
    raise "There are no planes in the airport" if @landed_planes == []
    plane = @landed_planes.pop
    plane.take_off
  end

  def weather
    weather_condition = rand(1..5)
  end
end
