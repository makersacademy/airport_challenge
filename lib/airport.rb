class Airport
  attr_accessor :planes, :stormy_weather

  def initialize
    @planes = []
    @stormy_weather = [true, false].sample
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "Weather is stormy" if @stormy_weather == true
    @planes.pop
  end

  def stormy?
    @stormy_weather
  end
end
