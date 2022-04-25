class Airport
  def initialize
    @planes = []
    @capacity = 20
    @weather = Weather.new
  end

  def takeoff(plane)
    if @weather.stormy?
      raise "Sorry, no takeoff when it's stormy"
    else
      raise "Sorry, this plane is not in the airport" unless @planes.include? plane
      @planes.delete(plane)
    end
  end

  def land(plane)
    if @weather.stormy?
      raise "Sorry, no landing when it's stormy"
    else
      raise "Sorry this airport is full" unless @planes.length < @capacity
      @planes << plane
    end
  end

  attr_accessor :capacity
  attr_reader :weather
  attr_reader :planes
end
