require_relative 'airport'
require_relative 'plane'

class Weather

  def initialize

  end

  def weather_rand
    rand(-30..50)
  end

  def stormy
    if weather_rand > 13
      @take_off
    else
      raise 'Unable to land due to stormy weather'
    end
  end

end

weather = Weather.new
weather.stormy
