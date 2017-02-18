class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def request_to_land(plane)
    @planes << plane
    true
  end

  def request_take_off(plane)
    @planes.delete(plane)
    true
  end

end
