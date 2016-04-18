class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @closed = false
  end

  def closed?
    @closed
  end

  def closed=(value)
    @closed = value
  end

  def include?(plane)
    planes.include?(plane)
  end

  def land(plane)
    raise("Airport is closed") if closed?
    raise("Airport is full") if full?
    raise("Plane is not flying") unless plane.flying?
    plane.land
    planes << plane
  end

  def take_off
    raise("No planes in airport") if empty?
    raise("Airport is closed") if closed?
    raise("Plane is not on the ground") if last_plane.flying?
    plane = planes.pop
    plane.take_off
    plane
  end

  def last_plane
    planes.last
  end

  private

  attr_reader :planes

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.length == 0
  end
end
