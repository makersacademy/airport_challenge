require 'airport'

class AirTrafficController
  attr_reader :name
  def initialize(name="Test")
    @name = name
  end

  def land?(plane, airport)
    if airport.weather == "Storm"
      raise "The conditions are too bad to land"
    else
      airport.land_plane(plane)
    end
    #airport.land_plane(plane)
  end

  def take_off
  end

  def check_planes
  end

end
