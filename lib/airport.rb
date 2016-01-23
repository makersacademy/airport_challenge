class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    raise "This plane has already landed." if planes.include?(plane)
    planes << plane
  end

  def take_off(plane)
    raise "This plane is not at the airport." unless planes.include?(plane)
  end

  def docked(plane)
    false
  end

  private
  attr_reader :planes

end