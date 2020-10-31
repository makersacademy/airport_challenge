class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
    plane.landed = true
  end

  def take_off
    raise 'Airport empty' if @planes.empty?
    plane = @planes.shift
    plane.landed = false
    plane
  end
end