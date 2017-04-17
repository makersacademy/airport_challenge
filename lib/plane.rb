## We create new Weather instances and point to the Airport 'planes' instance variable,
## so we must require those two files here
require './lib/airport'
require './lib/weather'

## This class has the responsibility of creating planes, landing them and making them take off
class Plane

  ## The 'land' method lands planes in the specified airport, unless it's stormy,
  ## the airport is full, or it's already landed
  def land(airport)
    todays_weather = Weather.new
    if todays_weather.stormy?
      raise "Too stormy, can't land"
    elsif airport.full?
      raise "Airport is full, can't land"
    elsif
      self.landed?(airport)
      raise "Cannot land, this plane has already landed in this airport"
    else
      airport.planes.push(self)
    end
  end

  ## The 'landed?' method checks whether or not a plane has landed at the airport specified
  def landed?(airport)
    airport.planes.include?(self)
  end

  ## The 'take_off' method gets a plane to take off, unless it's stormy or if it's already taken off
  def take_off(airport)
    todays_weather = Weather.new
      if todays_weather.stormy?
        raise "Too stormy, can't take off"
      elsif
        self.taken_off?(airport)
        raise "This plane can't take off from an airport it's not in, or if it's already in the air!"
      else
        airport.planes.delete(self)
      end
  end

  ## The 'taken_off?' method checks whether or not a plane has taken off from the airport specified
  def taken_off?(airport)
    !airport.planes.include?(self)
  end
end
