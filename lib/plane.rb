require_relative '../lib/airport'

class Plane
  #plane status - "landed" or "in-flight"
  attr_accessor :plane_status
  # plane instruct tells plane instance what to do
  # plane instruct is 'land'for land, 'takeoff' for takeoff and 'none' for no instruct
  attr_accessor :instruct
  # attr_accessor :instruct_takeoff

  def initialize
    #setting plane status - "landed" or "in-flight"
    @plane_status = "in-flight"
    # setting plane instruct to none
    @instruct = "none"
  end

  def land(airport)
    if @instruct == "land"
      # do not let plane land if airport is full
      raise 'No capacity in airport' if airport.landed_planes.length >= airport.capacity
      # do not let plane land if stormy
      if airport.current_weather == 0      # If we dont pass in weather, then automatically generate weather
        airport.current_weather = airport.weather
      end
      puts airport.current_weather
      if airport.current_weather > 8
        airport.current_weather = 0
        raise 'Too stormy to land'
      end
      # land a plane by adding it to the landed_planes
      airport.current_weather = 0
      @plane_status = "landed"
      @instruct = "none"
      airport.landed_planes << self
    else
      raise 'No instruct from airport to land'
    end
  end

  def takeoff(airport)
    if @instruct == "takeoff"
      #describes takeoff method based on which airport the plane is in
      # do not let plane takeoff if stormy
      if airport.current_weather == 0      # If we dont pass in weather, then automatically generate weather
        airport.current_weather = airport.weather
      end
      if airport.current_weather > 8
        airport.current_weather = 0
        raise 'Too stormy to takeoff'
      end
      # takeoff a plane by removing it from the landed_planes
      # return landed_planes to confirm the plane is no longer in the array
      airport.current_weather = 0
      airport.landed_planes.delete(self)
      @plane_status = "in-flight"
      @instruct = "none"
      airport.landed_planes
    else
      raise 'No instruct from airport to takeoff'
    end
  end
end
