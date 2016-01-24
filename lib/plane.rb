require_relative 'airport'

class Plane
  def landed?
    @landed
  end

  def land(airport)
    if airport.class != Airport
      fail 'Must land at a valid airport'
    elsif airport.weather == 'stormy'
      fail 'Unable to land during stormy weather'
    else  
      @landed = true
    end
  end

  def take_off(airport)
    if airport.class != Airport
      fail 'Must take off from a valid airport'
    elsif airport.weather == 'stormy'
      fail 'Unable to take off during stormy weather'
    else
      @landed = false  
    end
  end
end