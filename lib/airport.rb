require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = 'sunny'
  end

  def change_weather(n = rand(5))
    n == 4 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def take_off
    fail 'No planes' if empty?
    fail 'Not safe to take off' if weather == 'stormy'
    plane = planes.pop
    plane.tap(&:fly)
  end

  def landing(plane)
    fail 'Airport full' if full?
    fail 'Not safe to land' if weather == 'stormy'
    fail 'Not a plane' unless plane.respond_to?(:land)
    plane.land
    planes << plane
  end

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end
end
