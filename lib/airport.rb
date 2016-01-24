require_relative 'weather.rb'

class Airport
  attr_reader :capacity
  attr_reader :planes_landed
  # attr_reader :weather

  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes_landed = []
    @capacity = capacity
  end

  def take_off(plane)
    @planes_landed.delete(plane)
    puts "#{plane} has taken off"
    @plane = plane
  end

  def land(plane)
    fail "Cannot land in stormy conditions" if stormy?
    fail "Airport Full" if full?
    @plane = plane
    @planes_landed << plane
    puts "#{plane} has landed"
    @plane
  end

  private

  attr_reader :weather

  def full?
    planes_landed.count >= capacity ? true : false
  end

  def stormy?
    @weather.stormy?
  end


end
