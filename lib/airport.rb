require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Plane currently in airport" if in_airport?(plane)

    raise "Airport full, no space to land" if full?

    stormy?
    raise "Too stormy to land" if @stormy

    @planes << plane
  end

  def take_off(plane)
    raise "No planes in airport" if empty?

    raise "Plane not currently in airport" if in_airport?(plane) == false

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

  def in_airport?(plane)
    @planes.include?(plane)
  end

  DEFAULT_CAPACITY = 10
end
