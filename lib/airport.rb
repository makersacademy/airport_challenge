class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = false
  end

  def land(plane)
    @planes << plane if !planes.include?(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end


end
