class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def accept(plane)
    @planes << plane
    plane.land
  end

  def take_off(plane)
    @planes.delete(plane).take_off if @planes.include? plane
  end

end
