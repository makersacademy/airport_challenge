require_relative 'plane'
require_relative 'weather'

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
    weather = Weather.new
    current = weather.generate
    fail 'Cant take off in stormy weather' if current == 1
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
