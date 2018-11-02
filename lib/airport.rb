class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def accept(plane)
    @planes << plane
  end

  def release(plane)
    @planes.reject! { |p| p == plane }
  end
end
