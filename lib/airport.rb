class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def accept_plane(plane, weather = Weather.new)
    raise "Cannot land - severe weather warning!" if weather.stormy?
    
    @planes << plane
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end
end
