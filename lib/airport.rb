class Airport
  def initialize
    @planes = []
  end

  def stormy?
    rand(9) == 0 ? true : false
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
