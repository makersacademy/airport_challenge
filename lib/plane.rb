require_relative 'airport'

class Plane


  def initialize
    @plane_landed = nil
  end

  def land_plane(airport)

    land_plane_at_airport(airport) if landing_permission(airport)

  end


  def landing_permission(airport)

    fail "The weather is stormy, landing at #{airport} prevented" if airport.weather == 'stormy'
    fail "This airport is full. Cannot land here" if airport.airport_full? == true
    fail "Cannot land a plane that's already been landed" if @plane_landed != nil
    true

  end


  def land_plane_at_airport(airport)
    airport.planes_in_airport << self
    @plane_landed = true
  end


  def takeoff(airport)
    airport.planes_in_airport.delete(self)
    take_off_message

  end

  def take_off_message
    print "Plane has left the airport"
  end



end
