require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  attr_reader :planes, :weather
  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "airport is full" if full?
    fail "cannot land in stormy weather" if @weather.stormy?
    @planes << plane
    plane
  end

  def take_off
    fail "plane already taken off" if empty?
    fail "cannot take off, it is stormy" if @weather.stormy?

    @planes.pop
  end

  def full?
    @planes.length >= 3
  end

  def empty?
    @planes.length <= 0
  end
end
