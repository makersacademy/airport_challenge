class Airport
  attr_reader :planes, :weather
  
  def initialize (weather: Weather.new)
    @planes = []
    @weather = weather.stormy?
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    fail "It is too stormy for take off" if weather == true
    @planes.pop
  end

end
