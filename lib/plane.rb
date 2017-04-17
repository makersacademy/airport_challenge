require './lib/airport'
require './lib/weather'

class Plane
  def land(airport)
    todays_weather = Weather.new
    if todays_weather.stormy?
      raise "Too stormy, can't land"
    elsif airport.full?
      raise "Airport is full, can't land"
    elsif
      airport.planes.include?(self)
      raise "Cannot land, this plane has already landed in this airport"
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
      elsif
        !airport.planes.include?(self)
        raise "This plane can't take off from an airport it's not in, or if it's already in the air!"
      else
        airport.planes.delete(self)
      end
  end

  def taken_off?(airport)
    !airport.planes.include?(self)
  end
end
