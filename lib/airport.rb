require './lib/Plane.rb'

class Airport

  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "The plane can't be nil!" if plane == nil
    raise "Maximum capacity of the airport is reached!" if full?
    raise "This plane has already landed!" if planes.include? plane
    planes << plane
  end

  def take_off(plane)
    raise "The plane can't be nil!" if plane == nil
    raise "There are no planes at the airport for take off!" if empty?
    raise "This plane is already flying!" unless planes.include? plane
    planes.delete(plane)
  end

  private
  def full?
    planes.length == capacity ? true : false
  end

  def empty?
    planes.length.zero?
  end

end
