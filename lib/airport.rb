require 'weather'

class Airport

  attr_reader :DEFAULT_CAPACITY

  include Weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def clear_landing(plane)
    raise 'Airport is at capacity' if @planes.count == @capacity
    raise 'Weather is stormy and too unsafe' if stormy?

    @planes << plane
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  def clear_takeoff(plane)
    raise 'Plane is not at this airport' unless has_plane?(plane)
    raise 'Weather is stormy and too unsafe' if stormy?

    @planes.delete(plane)
  end

  private

  def stormy?
    self.weather == "stormy"
  end
end
