class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'This plane has already landed' if @planes.include?(plane)
    plane.land
    @planes.push(plane)
  end

  def take_off(plane)
    fail 'This plane has not landed yet' unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
  end
end
