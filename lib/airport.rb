require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  attr_reader :planes
  attr_accessor :capacity
  CAPACITY = 20
  def initialize(capacity=CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landed_at(plane)
    @planes << plane
  end

  def departed(plane)
    @planes.delete(plane)
  end

  def ready_for_take_off?
    return false if stormy? == true
    true
  end

  def ready_for_landing?
    return false if stormy? == true
    true
  end

  def full?
    return true if @planes.length >= @capacity
    false
  end

end
