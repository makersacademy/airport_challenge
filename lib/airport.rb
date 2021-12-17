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

    fail "Poor weather!" if weather? == true
    @planes << plane
  end

  def take_off 
    fail "No planes available!" if empty?

    fail "Poor weather!" if weather? == true
    @planes.pop
  end

  def weather?
    num = rand(0..1)
    return false unless num.zero?
    true
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty? 
    @planes.empty?
  end
  
end
