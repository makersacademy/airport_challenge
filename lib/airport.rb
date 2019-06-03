require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity, :safe_to_fly

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @safe_to_fly = Weather.new
  end

  def take_off

    fail 'No planes at airport' if @planes.empty?

    fail 'Weather not safe to take off' unless safe_to_fly

    @planes.pop
    'Plane has left the airport'
  end

  def land_plane(plane)

    fail 'Weather not safe to land' unless safe_to_fly

    fail 'Airport full' if @planes.count >= capacity

    @planes << plane
  end

end
