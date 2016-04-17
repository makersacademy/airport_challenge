require 'weather'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def safe_to_fly
    weather = Weather.new.weather_now
    if weather == 'stormy'
      false
    else
      true
    end
  end
  
  def land(plane)
    fail "Can't land when stormy" if safe_to_fly == false
    plane.location = self
    @planes << plane
    plane
  end

  def take_off(plane)
      fail "Can't take off when stormy" if safe_to_fly == false
      plane.location = "in_the_air"
      @planes.delete(plane)
  end

end
