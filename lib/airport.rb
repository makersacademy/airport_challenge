class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= 1
    @planes << plane
  end

  def take_off(plane)
    raise 'Airport is empty' if @planes.empty?
    @planes.pop
  end

end