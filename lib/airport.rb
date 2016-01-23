class Airport
  def initialize(capacity=10)
    @planes = []
    @capacity = capacity
  end

  attr_reader :capacity

  def land(plane)
    raise "This airport is full" if planes.length >= 10
    raise "This plane has already landed." if planes.include?(plane)
    raise "This plane is already landed at another airport." if plane.landed == true
    plane.landed = true
    planes << plane
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless planes.include?(plane)
    planes.delete(plane)
    plane.landed = false
    plane
  end

  private
  attr_reader :planes

end