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
    fail 'Cant take off in stormy weather' if weather == 1
    @plane.pop
  end

  def weather
    weather = Weather.new
    @current = weather.generate
  end

  private
    def full?
      @plane.count >= @capacity
    end

    def empty?
      @plane.empty?
    end

end
