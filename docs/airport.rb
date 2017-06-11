require './docs/plane.rb'
require './docs/weather.rb'

class Airport

attr_accessor :planes, :capacity, :weather

DEFAULT_CAPACITY = 45

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new.stormy?
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full!" if full?
    @planes << plane
  end

  def confirm_land(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def confirm_take_off(plane)
    !@planes.include?(plane)
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def unsafe_to_fly?
    @weather == "stormy"
  end

end
