require_relative 'airport'

class Plane
  def landed?
    @landed
  end

  def land(airport)
      fail 'Must land at a valid airport' if airport.class != Airport
      fail 'Unable to land during stormy weather' if airport.weather == 'stormy'
      fail 'Unable to land at full airport' if airport.number_of_planes == airport.capacity

      airport.add_plane
      @landed = true
  end

  def take_off(airport)
    if airport.class != Airport
      fail 'Must take off from a valid airport'
    elsif airport.weather == 'stormy'
      fail 'Unable to take off during stormy weather'
    else
      airport.subtract_plane
      @landed = false  
    end
  end
end