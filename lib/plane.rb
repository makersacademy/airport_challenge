require_relative "airport"

class Plane
  attr_accessor :location

  def change_location(location)
    @location = location
    location.planes.push(self) if location != "in air"
  end

end
