require_relative 'plane'

class Airport

  attr_reader :planes, :stormy, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = weather.stormy?
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Weather is too stormy to land" if stormy
    raise "No space to land" if full?

    planes << plane
  end

  def takeoff
    raise "Weather is too stormy to takeoff" if stormy
    raise "No planes in the airport" if empty?

    planes.pop
  end

  private

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    planes.empty?
  end
end
