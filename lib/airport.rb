class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    raise "This plane has already landed." if planes.include?(plane)
    planes << plane
  end

  def take_off(plane)
  end

  def docked(plane)
    false
  end

  private
  attr_reader :planes

end