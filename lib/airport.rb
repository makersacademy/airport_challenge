class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    planes.push(plane)
  end

  def plane_take_off
    planes.pop
  end

  private
  attr_reader :planes

end
