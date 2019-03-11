require "./lib/airport.rb"
class Plane

attr_accessor :location, :hangar 

  def initialize

  end

  def land(airport)
  end

  def take_off
    @location = "In the air"
  end
end
