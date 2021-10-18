require 'plane'

class Airport
  DEFAULT_CAPACITY = 7
  attr_accessor :capacity
  attr_reader :planes_on_ground

  def initialize(number = DEFAULT_CAPACITY)
    @planes_on_ground = []
    @capacity = number
  end 

  def land(plane)
    fail "Severe weather condition" if stormy?
    fail "Airport is full!" if full?
    @planes_on_ground << plane
  end

  def take_off
    fail "Severe weather condition" if stormy?
    fail "no plane on the ground!" if empty?
    return @planes_on_ground.pop
  end

  private

  def full? 
    @planes_on_ground.count >= @capacity
  end

  def empty?
    @planes_on_ground == []
  end

  def stormy?
    @condition = rand(100)
    if @condition >= 95
      return true
    else 
      return false
    end
  end

end
