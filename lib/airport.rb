require_relative 'weather'

class Airport
  attr_reader :capacity
  attr_reader :planes_landed
  attr_reader :weather

  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes_landed = []
    @capacity = capacity
  end

  def take_off(plane)
    fail "Cannot take off in stormy conditions" if stormy?
    plane.plane_take_off(self)
    remove_planes(plane)
    puts "#{plane} has taken off"
    @plane = plane
  end

  def land(plane)
    fail "Airport Full" if full?
    fail "Cannot land in stormy conditions" if stormy?
    plane.plane_landed(self)
    @plane = plane
    @planes_landed << plane
    puts "#{plane} has landed"
    @plane
  end



  private

  def full?
    planes_landed.count >= capacity ? true : false
  end

  def stormy?
    Weather.new.stormy?
  end

  def remove_planes(plane)
    @planes_landed.delete(plane)
  end

end
