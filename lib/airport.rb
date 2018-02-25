require_relative '../lib/plane'

class Airport
  # controls instances of Airport including landing, takeoff
  attr_reader :landed_planes
  attr_reader :weather
  attr_accessor :current_weather
  attr_reader :capacity

  DEFAULT_CAPACITY = 3
  @current_weather = 0
  # plane instruct tells plane instance what to do
  # plane instruct is true for land and false for no instruct

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @current_weather = 0
  end

  def instruct_land(plane)
    plane.instruct = "land"
  end

  def takeoff(plane)
    # do not let plane takeoff if plane is already in-flight
    raise 'Plane already in flight' if plane.plane_status == "in-flight"
    # do not let plane takeoff if stormy
    if @current_weather == 0      # If we dont pass in weather, then automatically generate weather
      @current_weather = weather
    end
    if @current_weather > 8
        @current_weather = 0
      raise 'Too stormy to takeoff'
    end
    # takeoff a plane by removing it from the landed_planes
    # return landed_planes to confirm the plane is no longer in the array
    @current_weather = 0
    @landed_planes.delete(plane)
    @plane_status = "in-flight"
    @landed_planes

  end

  def weather
    rand(1..10)
  end
end
