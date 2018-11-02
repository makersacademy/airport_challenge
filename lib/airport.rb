class Airport
  def initialize
    @planes = []
  end

  def show_planes
    planes
  end

  def accept(plane)
    @planes << plane
  end

  def release(plane)
    @planes.reject! { |p| p == plane }
  end

  private
  attr_reader :planes

end
