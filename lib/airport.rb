require_relative 'plane'

class Airport

attr_reader :planes, :capacity

  def initialize(capacity, planes=[])
    @planes = planes
    @capacity = capacity
  end

  def land(plane)
    fail 'The airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

  private
  def full?
    @planes.count == @capacity
  end
end
# 
# roissy = Airport.new(3)
# require './lib/plane.rb'
# plane = Plane.new
# 4.times {roissy.land(plane)}
