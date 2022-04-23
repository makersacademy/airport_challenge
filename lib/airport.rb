class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

  private

  attr_accessor :planes

end
