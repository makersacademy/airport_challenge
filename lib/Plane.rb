require_relative 'Weather'
require_relative 'Airport'

class Plane
  attr_reader :location

  def initialize
    @location = nil
    @in_air = false
  end

  def land_at(airport, current_weather)
    if airport.capacity - airport.docked_planes.count <= 0
      return "There are no free spaces at that airport."
    end

    if current_weather.stormy? == true
      @location
    else
      @location = airport
    end

    confirm_location
  end



  def take_off(current_weather)
    return "The plane is already in the air" if @in_air == true

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
