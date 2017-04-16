require './lib/airport'
require './lib/weather'

class Plane
  def land(airport)
    todays_weather = Weather.new
    if todays_weather.stormy?
      raise "Too stormy, can't land"
    elsif airport.full?
      raise "Airport is full, can't land"
    else
      airport.planes.push(self)
    end
  end

  def landed?(airport)
    airport.planes.include?(self)
  end

  def take_off(airport)
    todays_weather = Weather.new
      if todays_weather.stormy?
        raise "Too stormy, can't take off"
      else
      airport.planes.delete(self)
      end
  end

  def taken_off?(airport)
    !airport.planes.include?(self)
  end

end
