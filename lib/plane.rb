require '/Users/student/projects/airport_challenge/lib/airport.rb'

class Plane

  attr_accessor :flight_status

  def initialize(status='undefined')
    @flight_status = status
  end

  def land(airport)
    fail 'this plane has aleady landed' if flight_status == 'landed'
    airport.add_plane(itself)
    @flight_status = 'landed'
  end

  def take_off(airport)
    fail 'this plane has aleady taken off' if flight_status == 'flying'
    airport.remove_plane(itself)
    @flight_status = 'flying'
  end

end

# plane = Plane.new
# airport = Airport.new
# plane.land(airport)
# p plane.take_off(airport)
