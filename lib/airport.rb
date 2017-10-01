class Airport

  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise("Airport full -> can't accept planes!") if full?
    land_plane(plane)
  end

  def take_off
    raise("No planes at the airport!") if empty?
    take_off_plane
  end

private

  def full?
    @planes.length == @capacity
  end

  def empty?
    @planes.empty?
  end

  def land_plane(plane)
    plane.land
    @planes.push(plane)
  end

  def take_off_plane
    plane = @planes.shift
    plane.take_off
  end

end
