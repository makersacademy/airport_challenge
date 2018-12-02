require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize(capacity = 1, weather = Weather.new)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def land(plane)
     weather = @weather.get_weather
     if weather == 'stormy'
       @hangar
     elsif full?
      fail 'Hangar full'
     else
      @hangar << plane
    end
  end

  def take_off
     @hangar.pop
     @hangar
  end

private

  def full?
    @hangar.size >= @capacity
  end

end
