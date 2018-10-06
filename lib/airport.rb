require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
    @possible_weather = ["Sunny", "Stormy"]
  end

  def land(plane)
    raise("Plane has already landed") if @hangar.include?(plane)
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    raise("Plane is not at airport") unless @hangar.include?(plane)
    raise("Cannot takeoff in stormy weather") if check_weather == "Stormy"
    @hangar.delete(plane)
  end

  def check_weather
    @possible_weather.sample
  end
end
