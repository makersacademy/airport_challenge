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
    # airport send instruction for plane to land
    # do not let plane be instruct to land if plane is already landed
    raise 'Plane already landed' if plane.plane_status == "landed"
    plane.instruct = "land"
  end

  def instruct_takeoff(plane)
    # airport send instruction for plane to takeoff
    # do not let plane takeoff if plane is already in-flight
    raise 'Plane already in flight' if plane.plane_status == "in-flight"
    plane.instruct = "takeoff"
  end

  def weather
    rand(1..10)
  end
end
