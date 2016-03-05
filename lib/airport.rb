class Airport

  attr_reader :planes

  def initialize
  @planes = []
  end


  def arrive(plane, weather)
    raise "there is a storm" if weather.storm? 
    @planes << plane
  end

  def depart(plane)
    @planes.delete(plane)
  end

  def storm(weather)
    weather.storm?
  end
end