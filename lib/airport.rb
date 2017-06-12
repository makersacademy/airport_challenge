class Airport

  attr_reader :runways, :weather, :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @weather = Weather.new
    @runways = []
    @capacity.times { @runways << Airplane.new }
  end

  def take_off(plane)
    raise "Airport is empty." if empty
    @weather.stormy?
    @runways.delete(plane)
  end

  def land(plane)
    raise "Plane is landed." if landed?(plane)
    raise "Airport is full." if full
    @weather.stormy?
    @runways << plane
  end

  def landed?(plane)
    @runways.include? plane
  end

  def flying?(plane)
    !@runways.include? plane
  end

  def full
    @runways.count == @capacity
  end

  def empty
    @runways.empty?
  end

end
