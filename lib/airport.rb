class Airport
  attr_reader :planes
  
  def initialize(weather)
    @planes = []
  end
  
  def land(plane)
    @planes << plane
    puts 'Plane landed!'
    self
  end

  def clear_for_takeoff(plane)
    puts 'Up, up and away!'
    @planes -= [plane]
    self
  end

end
