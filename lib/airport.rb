# require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if full?
    raise 'Landing is cancelled due to bad weather!' if stormy?
    raise 'UUUUUUUUPPPPPS!!!!' if landed?(plane)

    @planes << plane
  end

  def take_off(plane)
    raise 'Take off is cancelled due to bad weather!' if stormy?
    raise 'Plane not in the airport!' unless @planes.include?(plane)

    @planes.pop
  end

  private

  def full?
    @planes.count == capacity
  end

  def stormy?
    rand(1..10) > 8
  end

  def landed?(plane)
    @planes.include?(plane)
  end
end
