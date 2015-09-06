class Airport
  CAPACITY = 10

  attr_reader :capacity

  def initialize
    @planes = []
  end

  def planes?
    @planes
  end

  def receive(plane)
    plane.land
    @planes << plane
  end

  def release
    fail 'No planes available.' if empty?

    plane = @planes.pop
    plane.take_off
    plane
  end

  private

  def full?
    planes.length >= CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
