class Airport
  attr_reader :planes
  attr_reader :weather
  attr_reader :capacity


  def initialize(capacity=20)
    @planes = []
    @capacity = capacity
    rand(1..20) < 20 ? @weather = "sunny" : @weather = "stormy"
  end

  def land(plane)
    raise "Stormy weather - no landing" if self.weather == "stormy" #check - why did I need self.weather and could not use @weather??
    raise "Airport full - no landing" if @planes.length >= self.capacity #check - why did I need self.weather and could not use @weather??

    @planes << plane
  end

  def takeoff(plane)
    raise "Stormy weather - no takeoff" if self.weather == "stormy" #check - why did I need self.weather and could not use @weather??
    @planes.delete(plane)
  end

end
