require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off(stormy = @safe_to_fly)

    fail 'No planes at airport' if @planes.empty?

    fail 'Weather not safe to take off' if stormy

    @planes.pop
    'Plane has left the airport'
  end

  def land_plane(plane, stormy = @safe_to_fly)

    fail 'Weather not safe to land' if stormy

    fail 'Airport full' if @planes.count >= capacity

    @planes << plane
  end

  def safe_to_fly
    weather = Weather.new
    @safe_to_fly = weather.generate_weather
  end

end
