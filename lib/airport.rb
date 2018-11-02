class Airport
  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = 5
  end

  def stormy?
    rand(9).zero? ? true : false
  end

  def full?
    @planes.length >= @capacity
  end

  def accept(plane)
    @planes << plane
  end

  def release(plane)
    @planes.reject! { |p| p == plane }
  end
end
