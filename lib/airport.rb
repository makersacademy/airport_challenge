class Airport

  attr_reader :planes, :weather, :capacity

  def initialize(weather, capacity = 10)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def request_to_land(plane)
    raise "The weather conditions are not suitable for landing!" if @weather.sunny? == false
    raise "The airport can't accept the plane because it's full!" if full?
    @planes << plane
    true
  end

  def full?
    @planes.count >= @capacity
  end

  def request_take_off(plane)
    raise "The weather conditions are not suitable for take off!" if @weather.sunny? == false
    @planes.delete(plane)
    true
  end

end
