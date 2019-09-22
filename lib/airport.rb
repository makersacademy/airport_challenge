require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :capacity
  attr_accessor :stormy
  AIRPORT_CAPACITY = 100

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = []
    condition = Weather.new
    @weather = condition.stormy
  end

  def land_plane(plane)
    fail 'Landing prevented due to stormy weather' if stormy

    fail 'Airport full' if full?

    @planes << plane
  end

  def take_off
    fail 'Take off prevented due to stormy weather' if stormy

    @planes.pop
    "The plane has taken off"
  end

  private

  def full?
    return true if @planes.count >= capacity
  end

end
