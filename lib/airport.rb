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
  
end
