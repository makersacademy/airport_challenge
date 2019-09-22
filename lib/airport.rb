require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail 'Landing prevented due to stormy weather' if @weather == 'stormy'

    fail 'Airport full' if @planes.count >= 100

    @planes << plane
  end

  def take_off
    fail 'Take off prevented due to stormy weather' if @weather == 'stormy'

    @planes.pop
    "The plane has taken off"
  end

  def weather
    weather_options = ['sunny', 'stormy']
    @weather = weather_options.sample
  end

end
