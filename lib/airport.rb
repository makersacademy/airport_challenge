require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :plane, :capacity, :safe_to_fly

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off
    check_weather

    # NOT WORKING
    fail 'Weather is not safe to take off' unless @safe_to_fly

    fail 'No planes at airport' if @planes.empty?

    @planes.pop
    'Plane has left the airport'
  end

  def land_plane(plane)
    check_weather

    # NOT WORKING
    fail 'Weather is not safe for landing' unless @safe_to_fly

    fail 'Airport full' if @planes.count >= capacity

    @planes << plane
  end

  def check_weather
    weather = Weather.new
    if weather.generate_weather == 'stormy'
      @safe_to_fly = false
    else
      @safe_to_fly = true
    end
  end

end
