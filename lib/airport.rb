require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "airport is full" if full?
    fail "cannot land in stormy weather" if @weather.stormy?
    fail "plane already at airport" if landed?(plane)

    @planes << plane
    plane
  end

  def take_off
    fail "plane already taken off" if empty?
    fail "cannot take off, it is stormy" if @weather.stormy?

    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length <= 0
  end

  def landed?(plane)
    @planes.include?(plane)
  end
end
