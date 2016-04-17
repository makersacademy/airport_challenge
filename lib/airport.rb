require 'weather'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.location = self
    @planes << plane
    plane
  end

  def safe_to_fly
    weather = Weather.new.weather_now
    if weather == 'stormy'
      false
    else
      true
    end
  end


  def take_off(plane)
      fail "Planes cannot take off if the weather is stormy" if safe_to_fly == false
      plane.location = "in_the_air"
      @planes.delete(plane)
  end

end
