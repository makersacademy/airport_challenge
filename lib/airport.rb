require '/Users/agnieszkadufrat/Projects/airport_challenge/lib/plane.rb'

class Airport
  attr_accessor :planes, :stormy_weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy_weather = false #[true, false].sample
    @capacity = capacity
  end

  def land(plane)
    fail "Planes can't land, the airport is full" if full?
    fail "Planes can't land, weather is stormy" if @stormy_weather == true
    @planes << plane
  end

  def take_off(plane)
    fail "Weather is stormy" if @stormy_weather == true
    fail "The plane is flying, cannot take off" if plane.position == "air"
    @planes.pop
  end

  private
  def full?
    true if @planes.size >= @capacity
  end
end
