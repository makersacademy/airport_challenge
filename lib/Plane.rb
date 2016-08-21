require_relative 'Weather'
require_relative 'Airport'

class Plane
  attr_reader :location

  def initialize
    @location = nil #location starts off at nil because location can only be set to an airport or nil
    @install_at_used = false #stops you from using the install_at method more than once
  end

  def land_at(airport, current_weather)
    if self.location != nil #when the plane is not in the air it cannot land!
      return "The plane is already on the ground at #{@location}"
    end

    if vacency_check(airport) == false
      return "There are no free spaces at that airport."
    end

    if current_weather.stormy? == true
      "Can't land, due to bad weather."
    else
      set_location(airport)
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

  def install_at(airport)
    #this method is only to be used to install a plane at a location for the first time
    #it is designed to simulate the shipping of the plane from the factory to its first airport
    #under which circumstances weather would not be a factor
    if @install_at_used == false
      if vacency_check(airport) == false
        return "There are no free spaces at that airport."
      else
        set_location(airport) #also sets @install_at_used to eq true
      end
    else
      raise "You can only 'install' a plane at an airport once"
    end
  end

  def confirm_location
    if @location == nil
      "The plane is currently in the air."
    else
      "The plane is currently at #{@location}."
    end
  end

  private

  def vacency_check(airport) #checks to see if the aiport has space for the plane.
    if airport.capacity - airport.docked_planes.count <= 0
      false
    else
      true
    end
  end #returns true if the airport has space for the plane and false otherwise

  def set_location(airport) #abstracting out of the install_at and land_at methods
    @location = airport
    airport.add_plane(self)
    @install_at_used = true #whenever a plane is set to an airport, install_at becomes redundant so can be considered "used"
  end
end
