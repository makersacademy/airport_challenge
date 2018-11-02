class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def stormy?
    rand(9) == 0 ? true : false
  end

  def full?
    @planes.length >= 5
  end

  def accept(plane)
    @planes << plane
  end

  def release(plane)
    @planes.reject! { |p| p == plane }
  end
end
