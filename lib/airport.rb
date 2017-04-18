require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 12

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def change_capacity(num)
    @capacity = num
  end

  def safe_to_fly(weather = Weather.new.weather_now)
    false if weather == 'stormy'
  end

  def land(plane)
    self.safe_to_fly
    fail "Can't land when stormy" if safe_to_fly == false
    fail "Can't land at a full airport" if @planes.length >= @capacity
    fail "Can't land while landed" if plane.location.is_a?(Airport)
    plane.location = self
    @planes << plane
    plane
  end

  def take_off(plane)
    self.safe_to_fly
    fail "Can't take off when stormy" if safe_to_fly == false
    fail "Can't take off if flying" if plane.location == "in_the_air"
    plane.location = "in_the_air"
    @planes.delete(plane)
  end

end
