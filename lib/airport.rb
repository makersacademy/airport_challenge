# require Plane class, pass in as argument to initialize for less dependency
require_relative '../lib/plane'

class Airport
  # controls instances of Airport including landing, takeoff
  attr_reader :landed_planes
  attr_accessor :current_weather
  attr_reader :capacity

  DEFAULT_CAPACITY = 100
  @current_weather = 0

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @current_weather = 0
  end

  def instruct_land(plane)
    # airport send instruction for plane to land
    # do not allow instruct to land if plane is already landed
    raise 'Plane already landed' if plane.plane_status.include?("landed")
    plane.instruct = "land"
    # add the airport to plane_status so plane is indexed to airport
    plane.plane_status << self
  end

  def instruct_takeoff(plane)
    # airport send instruction for plane to takeoff
    # do not let plane takeoff if plane is already in-flight
    raise 'Plane already in flight' if plane.plane_status == ["in-flight"]
    raise 'Plane is not in this airport' if plane.plane_status != ["landed", self]
    plane.instruct = "takeoff"
  end

  def weather
    # generates a random number from 1 -10 inclusive
    # 1-8 reperesent weather that is good enough to takeoff and land
    # 9, 10 represent weather that planes can not land or takeoff (20%)
    rand(1..10)
  end
end
