require 'Weather'

class Plane
  attr_reader :location

  def initialize    #planes do not start off in airports and @location just
    @location = nil #tracks which airport the plane is in. So, until its put
  end               #in an airport, it is nil.

  def land_at(airport, current_weather)
    if current_weather.stormy? != true
      @location = airport
    else
      @location
    end
    confirm_location
  end

  def take_off(current_weather)
    if current_weather.stormy? != true
      @location = nil #while the plane is in the air, it's location is nil
      confirm_location
    else
      "Can not take off in stormy weather. " + confirm_location
    end
  end

  def confirm_location
    if @location == nil
      "The plane is currently in the air."
    else
      "The plane is currently at #{@location}."
    end
  end

end
