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
  end

  def take_off?(plane, airport)
    if airport.weather == "Storm"
      raise "The conditions are too bad to take off"
    else
      airpot.take_off_plane(plane)
    end
  end

  def check_planes(airport)
    airport.planes_at_airport
  end

end
