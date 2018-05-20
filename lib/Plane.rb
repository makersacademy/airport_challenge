require_relative 'Airport'

class Plane
  
  attr_reader :location, :current_airport

  def initialize
    @current_airport = nil
    @location = "Flying"
  end

  # lands a plane at an airport
  def land(airport)
    unless @location == "Flying"
      raise "Cannot land if already on ground"
    end
    airport.add_plane(self)
    @current_airport = airport
    @location = airport.name
  end

  # takes the plane off
  def take_off
    raise "Can't take off if already flying" if @location == "Flying"
    @current_airport.remove_plane(self)
    @location = "Flying"
  end

end
