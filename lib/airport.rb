require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    fail 'Not an integer' unless capacity.is_a?(Integer)
    fail 'Not positive' unless capacity > 0
    @planes = []
    @capacity = capacity
    @weather = 'sunny'
  end

  def change_weather(n = rand(5))
    n == 4 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def take_off(n)
    fail 'Not safe to take off' if weather == 'stormy'
    n == 1 ? takes_off : take_offs(n)
  end

  def takes_off
    fail 'No planes' if empty?
    plane = planes.pop
    plane.tap(&:fly)
  end

  def take_offs(n)
    fail 'Not enough planes' if planes.length < n
    if n == 2 || n == 3
      plane = planes.pop(n)
      plane.each(&:fly)
    else
      fail 'Too many planes taking off'
    end
  end

  def landing(plane)
    fail 'Airport full' if full?
    fail 'Not safe to land' if weather == 'stormy'
    fail 'Not a plane' unless plane.respond_to?(:lands)
    plane.lands
    planes << plane
  end

  #   def landing(plane, *args)
  #   fail 'Airport full' if full?
  #   fail 'Not safe to land' if weather == 'stormy'
  #   fail 'Not a plane' unless plane.respond_to?(:land)
  #   arr = [plane] + args
  #   arr.each(&:land)
  #   planes += arr
  # end

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end
end
