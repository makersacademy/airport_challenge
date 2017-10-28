class Airport
  attr_reader :planes

  def initialize(planes = [])
    @planes = planes
  end

  def land(plane)
    raise "This plane is already at this airport." if @planes.include?(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless @planes.include?(plane)
    @planes.delete(plane)
  end

end
