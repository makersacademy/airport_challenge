class Airport

  attr_reader :name
  attr_reader :planes
  attr_reader :capacity

  def initialize(name = "airport", capacity = 20)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

end
