require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off
    Plane.new
  end

  def land plane
    fail 'Plane can not land, the airport is full.' if full?
    planes << plane
  end

  def traffic_control
    fail 'Plane can not land, the airport is full.' if full?
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  attr_reader :planes
  
end
