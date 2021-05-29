require_relative 'plane'
DEFAULT_CAPACITY = 10

class Airport

  DEFAULT_CAPACITY = 10
  
  attr_reader :plane_no, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_no = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'Stormy!' if stormy?
    @plane_no << plane

  end

  def take_off(plane)
  @plane_no.pop
  end
  
  private

  def full?
    if @plane_no.length >= @capacity
        true
    else 
        false
    end
  end

  def stormy?
    if rand(1..10) > 9
        true
    else
        false
    end
  end
end