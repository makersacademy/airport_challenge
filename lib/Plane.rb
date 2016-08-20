require_relative 'Weather'
require_relative 'Airport'

class Plane
  attr_reader :location

  def initialize
    @location = nil
  end

  def vacency_check(airport) #checks to see if the aiport has space for the plane.
    if airport.capacity - airport.docked_planes.count <= 0
      false
    else
      true
    end
  end #returns true if the airport has space for the plane and false otherwise

  def land_at(airport, current_weather)
    if vacency_check(airport) == false
      return "There are no free spaces at that airport."
    end

    if current_weather.stormy? == true
      "Can't land, due to bad weather."
    else
      @location = airport
      airport.add_plane(self)
    end

    confirm_location
  end

  def take_off(current_weather)
    return "The plane is already in the air" if @location == nil

    if current_weather.stormy? == false
      @location.remove_plane(self)
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
