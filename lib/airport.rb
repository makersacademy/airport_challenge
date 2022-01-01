require_relative "plane"

class Airport 
  attr_accessor :capacity
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "No space at the airport!" if full?

    fail "Plane is already in the airport!" if @planes.include? plane

    fail "Poor weather!" if weather? == true

    plane.dock 
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not at the airport" unless @planes.include? plane

    fail "Poor weather!" if weather? == true
  
    plane.undock
    @planes.delete(plane)
  end

  def weather?
    return false unless random.zero?
    true
  end

  def random
    rand(0..5)
  end

  private

  def full?
    @planes.count >= @capacity
  end
  
end
