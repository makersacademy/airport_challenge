require_relative 'airport'

class Plane


  def initialize

    @plane_landed = nil
    @current_airport

  end

  def land_plane(airport)

    land_plane_at_airport(airport) if landing_permission(airport)

  end

  def takeoff(airport)

    commence_take_off unless take_off_allowed == false
    take_off_message

  end

  private

  def landing_permission(airport)

    fail "The weather is stormy, landing at #{airport} prevented" if airport.weather == 'stormy'
    fail "This airport is full. Cannot land here" if airport.airport_full? == true
    fail "Cannot land a plane that's already been landed" if @plane_landed != nil
    true

  end


  def land_plane_at_airport(airport)

    airport.planes_in_airport << self
    @plane_landed = true
    @current_airport = airport

  end


  def commence_take_off

    @current_airport.planes_in_airport.delete(self)
    @current_airport = nil
  end

  def take_off_message

    print "Plane has left the airport"

  end



  def take_off_allowed

    fail "You cannot take off from this airport due to weather conditions" if @current_airport.weather == 'stormy'
    fail "You are already in the air!" if @current_airport == nil
    true

  end



end
