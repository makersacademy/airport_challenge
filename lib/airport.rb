class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end
  
  def land(plane)
    @planes << plane
    puts 'Plane landed!'
    self
  end

  def clear_for_takeoff(plane)
    puts 'Up, up and away!'
    self
  end

end
