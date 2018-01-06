require "./lib/weather.rb"
require "./lib/airport.rb"

class Plane
  DEFAULT_LOCATION = "flying"
  attr_reader :location

  def initialize(location = DEFAULT_LOCATION)
    @location = location
  end

  def land(weather, airport)
    if self.location != "flying"
      "plane not in the air and cannot land"
    elsif weather.stormy == 1
      "stormy weather prevents landing"
    elsif weather.stormy.zero? && airport.capacity == false
      "airport full, cannot land"
    elsif weather.stormy.zero? && airport.capacity == true
      p "landed at #{airport}"
      airport.hangar << self
      @location = airport.object_id
    end
  end

  def take_off(weather, airport)
    if weather.stormy.zero? && airport.object_id == @location
      "take off"
    elsif weather.stormy.zero? == false && airport.object_id == @location
      "stormy weather prevents take off"
    elsif weather.stormy.zero? && airport.object_id != @location
      "incorrect take-off request"
    end
  end
end
