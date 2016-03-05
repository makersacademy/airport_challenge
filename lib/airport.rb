class Airport

  attr_reader :planes
  DEFAULT_CAPACITY=20
  
  def initialize(capacity=DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  end


  def arrive(plane, weather)
    raise "there is a storm" if weather.storm? 
    raise "airport is full" if full?
    @planes << plane
  end

  def depart(plane, weather)
    raise "there is a storm" if weather.storm? 
    @planes.delete(plane)
  end

  def storm(weather)
    weather.storm?
  end

private
  
  def full?
    planes.length >= @capacity
  end

end