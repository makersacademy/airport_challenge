require_relative 'plane'

class Airport

  attr_reader :plane

  def land_plane(plane)
    fail 'Landing prevented due to stormy weather' if @weather == 'stormy'
    fail 'Airport full' if @plane 
    @plane = plane
  end

  def take_off
    fail 'Take off prevented due to stormy weather' if @weather == 'stormy'
    @plane
    "The plane has taken off"
  end

  def weather
    weather_options = ['sunny', 'stormy']
    @weather = weather_options.sample
  end

end
