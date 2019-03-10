require "./lib/airport.rb"
class Plane

  def land
    @location = airport
  end

  def take_off
    @location = "In the air"
  end
end
