require_relative 'plane'
class Airport

  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if full?

    raise "Plane has already landed" if @planes.include?(plane)

    raise "It is too stormy to land" if stormy?

    @planes << plane
  end

  def takeoff
    raise "There are no planes" if empty?

    raise "It is too stormy to takeoff" if stormy?

    @planes.pop
  end

  def stormy?
    # 1 in 10 chance it is stormy
    storminess = rand(10)
    storminess == 9
  end

private

  def full?
    @planes.length >= capacity
  end

  def empty?
    @planes.empty?
  end

end
