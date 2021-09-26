require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "The weather is bad! You can't land!" if self.weather == 5
    fail "You can't land here. We're full!" if hangar.size >= capacity
    @hangar << plane
  end

  def take_off(plane)
    fail "The weather is bad! Stay on the ground!" if self.weather == 5
    hangar.delete(plane)
    plane
  end 

  def airborne?(plane)
    !hangar.include?(plane)
  end

  private

  def weather
    rand(0..5)
  end
end
