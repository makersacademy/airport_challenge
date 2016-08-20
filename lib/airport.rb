class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes.push(plane)
    planes
  end


end
