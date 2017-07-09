require_relative 'plane'
require_relative 'weather'

class Airport
  CAPACITY = 10

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def instruct_take_off(plane)
    raise "Take off denied due to bad weather" if stormy?
    planes.delete(plane)
  end

  def allow_landing(plane)
    raise "Landing denied due to bad weather" if stormy?
    raise "#{self.class.name} full" if full?
    planes << plane
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather.forecast == :stormy ? true : false
  end

end
