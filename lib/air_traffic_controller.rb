require 'airport'

class AirTrafficController
  attr_reader :name
  def initialize(name="Test")
    @name = name
  end

  def land?(plane, airport)
    if airport.weather == "Storm"
      puts "The conditions are too bad to land"
    end
    #airport.land_plane(plane)
  end

  def take_off
  end

  def check_planes
  end

end
