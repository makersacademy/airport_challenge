require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Airport full, no space to land" if full?

    stormy?
    raise "Too stormy to land" if @stormy

    @planes << plane
  end

  def take_off(plane)
    raise "No planes in airport" if empty?

    stormy?
    raise "Too stormy to take off!" if @stormy

    @planes.delete(plane)
    "#{plane} has left the airport"
  end

  def stormy?
    rand(1..5) == 5 ? @stormy = true : @stormy = false
  end

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.size.zero?
  end

  DEFAULT_CAPACITY = 10
end
