class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def request_to_land(plane)
    @planes << plane
    true
  end

end
