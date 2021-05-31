require_relative 'plane'
# DEFAULT_CAPACITY = 10

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
    raise 'Stormy!' if stormy?
    raise 'Wrong airport!' unless @plane_no.include?(plane)

    @plane_no.pop
  end

  private

  def stormy?
    rand(1..10) > 9
  end

  def full?
    @plane_no.length >= @capacity
  end
end
