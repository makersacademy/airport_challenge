# require '/Users/student/projects/airport_challenge/lib/airport.rb'

class Plane

  attr_reader :flight_status

  def initialize(status='undefined')
    @flight_status = status
  end

  def land(airport)
    airport.add_plane(itself)
    @flight_status = 'landed'
  end

  def take_off(airport)
    airport.remove_plane(itself)
    @flight_status = 'flying'
  end

end

# plane = Plane.new
# airport = Airport.new
# plane.land(airport)
