require_relative 'airport'

class Plane
  def landed?
    @landed
  end

  def land(airport)
    if airport.class != Airport
      fail 'Must land at a valid airport'
    else
      @landed = true
    end
  end

  def take_off(airport)
    if airport.class != Airport
      fail 'Must take off from a valid airport'
    else
      @landed = false  
    end
  end
end