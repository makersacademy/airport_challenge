require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :plane
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport capacity reached. No more landing allowed." if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  private

  def full?
    true if @planes.length >= @capacity
  end
end
