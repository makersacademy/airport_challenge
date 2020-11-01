require_relative 'plane'

class Airport

attr_reader :plane
attr_accessor :capacity

DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport Full' if full?
    @plane << plane
  end

  def take_off(plane)
    @plane.pop
  end

  private
    def full?
      @plane.count >= @capacity
    end

    def empty?
      @plane.empty?
    end

end
