require_relative '../domain/aeroplane'

class AirTrafficControl 

  def initialize()
    @planes = []
    @airports = []
    @status_codes = [Aeroplane::FLYING]
  end

  attr_reader :planes, :airports

  def add_plane(plane)
    @planes << plane
  end

  def add_airport(airport)
    @status_codes << airport.code
    @airports << airport
  end

  def find_plane_by_id(planeId)
    planes.find {|plane| plane.id == planeId}
  end

  def find_airport_by_id(airportId)
    airports.find {|airport| airport.id == airportId}
  end

  def find_airport_by_code(code)
    airports.find {|airport| airport.code == code}
  end

  def status_codes
    @status_codes
  end

  def get_plane_status(planeId)
    plane = planes.find {|plane| plane.id == planeId}
    plane.status
  end

end