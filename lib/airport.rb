require_relative '../lib/plane'

class Airport
  # controls instances of Airport including landing, takeoff
  attr_reader :landed_planes
  attr_accessor :current_weather
  attr_reader :capacity
  DEFAULT_CAPACITY = 3
  @current_weather = 0

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @current_weather = 0
  end

  def land(plane)
    # do not let plane land if plane is already landed
    raise 'Plane already landed' if @plane_status == "landed"
    # do not let plane land if airport is full
    raise 'No capacity in airport' if @landed_planes.length >= @capacity
    # do not let plane land if stormy
    if @current_weather == 0      # If we dont pass in weather, then automatically generate weather
      @current_weather = weather
    end
    puts @current_weather
    if @current_weather > 8
      @current_weather = 0
      raise 'Too stormy to land'
    end
    # land a plane by adding it to the landed_planes
    @current_weather = 0
    @plane_status = "landed"
    @landed_planes << plane
  end

  def takeoff(plane)
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
    @landed_planes

  end

  def weather
    rand(1..10)
  end
end
