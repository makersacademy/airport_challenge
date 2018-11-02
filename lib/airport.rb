class Airport
  attr_accessor :planes, :stormy_weather

  def initialize
    @planes = []
    @stormy_weather = false #[true, false].sample
  end

  def land(plane)
    fail "Planes can't land, weather is stormy" if @stormy_weather == true
    @planes << plane
  end

  def take_off(plane)
    fail "Weather is stormy" if @stormy_weather == true
    @planes.pop
  end
end
