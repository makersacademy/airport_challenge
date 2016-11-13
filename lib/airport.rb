require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  attr_accessor :stormy

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @stormy = Weather.new.stormy?
    @planes = []
    @capacity = capacity
  end

  def status(plane)
    return "Landed" if plane.landed == true
    return "In the air" if plane.landed == false
  end

  def land(plane)
    bad_weather?
    full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    bad_weather?
    plane.take_off
    remove_from_airport(plane)
  end

  private

  def remove_from_airport(plane)
    @planes.delete(plane)
  end

  def bad_weather?
    fail "Plane cannot do this during a storm." if @stormy
  end

  def full?
    fail "The airport is full." if @planes.length >= @capacity
  end

end
