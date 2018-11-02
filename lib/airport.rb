class Airport
  attr_accessor :planes, :stormy_weather, :capacity

  def initialize
    @planes = []
    @stormy_weather = [true, false].sample
    @capacity = 5
  end

  def land(plane)
    fail "Planes can't land, the airport is full" if full?
    fail "Planes can't land, weather is stormy" if @stormy_weather == true
    @planes << plane
  end

  def take_off(plane)
    fail "Weather is stormy" if @stormy_weather == true
    @planes.pop
  end

  private
  def full?
    true if @planes.size >= @capacity
  end
end
