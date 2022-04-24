class Airport
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = Array.new
    @weather = Weather.new
  end

  def land(plane)
    fail 'Airport full' if full?
    land_plane(plane)
  end

  def take_off(plane)
    fail 'Weather is stormy' if stormy?
    fail 'Plane not at airport' unless include?(plane)
    take_off_plane(plane)
  end

  def include?(plane)
    planes.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end

  private

  attr_reader :planes, :capacity, :weather

  def take_off_plane(plane)
    plane.take_off
    planes.delete(plane)
  end

  def land_plane(plane)
    plane.land
    planes << plane
  end

  def full?
    planes.length == capacity
  end
end
