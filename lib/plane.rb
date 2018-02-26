# require Airport class, pass in as argument to initialize for less dependency
require_relative '../lib/airport'

class Plane
  # plane status can be landed or in-flight
  attr_accessor :plane_status
  # plane instruct tells plane instance what to do
  # plane instruct is 'land', 'takeoff' and 'none'
  attr_accessor :instruct

  def initialize
    # setting plane status to array set to in-flight
    @plane_status = ["in-flight"]
    # setting plane instruct to none
    @instruct = "none"
  end

  def land(airport)
  # land a plane in selected airport
    if @instruct == "land" && @plane_status == ["in-flight", airport]
      # do not let plane land if airport is full
      raise 'No capacity in airport' if airport.landed_planes.length >= airport.capacity
      # do not let plane land if stormy
      if airport.current_weather.zero?
        # If we dont pass in weather, then automatically generate weather
        airport.current_weather = airport.weather
      end
      if airport.current_weather > 8
        airport.current_weather = 0
        raise 'Too stormy to land'
      end
      # land a plane by adding it to the landed_planes
      airport.current_weather = 0
      @plane_status = ["landed", airport]
      @instruct = "none"
      airport.landed_planes << self
    else
      raise 'No instruct to land from this airport to land'
    end
  end

  def takeoff(airport)
  # takeoff a plane from a selected airport
    if @instruct == "takeoff" && @plane_status == ["landed", airport]
      # describes takeoff method based on which airport the plane is in
      # do not let plane takeoff if stormy
      if airport.current_weather.zero?
        # If we dont pass in weather, then automatically generate weather
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
      @plane_status = ["in-flight"]
      @instruct = "none"
      airport.landed_planes
    else
      raise 'No instruct to takeoff from this airport to takeoff'
    end
  end
end
