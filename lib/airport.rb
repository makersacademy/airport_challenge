require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def empty?
    planes.count == 0
  end

  def take_off
    fail 'The airport is empty' if empty?
    planes.last.take_off
    planes.pop
  end

  def landing plane
    fail 'Cant land too stormy' if stormy?
    fail 'The airport is full' if full?
    planes << plane
    plane.landing
  end

  private

  attr_reader :planes

  def full?
    planes.count == capacity
  end

  def weather
    weather_options = ['stormy', 'clear', 'clear', 'clear', 'clear',]
    weather_options.sample
  end

  def stormy?
    weather == 'stormy'
  end
end
