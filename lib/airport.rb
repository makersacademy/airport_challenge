require_relative './plane.rb'

class Airport
attr_reader :capacity
AIRPORT_CAPACITY=20
  def initialize(capacity=AIRPORT_CAPACITY)
    @planes=[]
    @capacity=capacity
  end

  def land(plane)
    fail "airport is full" if full?
    @planes << plane
  end

  def take_off
    fail 'no planes available' if empty?
    @planes.pop
  end

  private
  attr_reader :planes

  def full?
    @planes.count>=capacity
  end

  def empty?
    @planes.empty?
  end

end
