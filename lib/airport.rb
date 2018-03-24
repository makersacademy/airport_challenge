require_relative 'plane'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full to capacity' if full?
    @planes << plane
  end

  def takeoffplane
    raise 'No planes available for takeoff' if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.empty?
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(PASS) Planes take off from airport
(PASS) Check plane removed from airport
=end
