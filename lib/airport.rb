require 'plane.rb'
require 'weather.rb'

class Airport

  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new

  end

  def land(plane)
    raise "The plane can't be nil!" if plane == nil
    raise "Maximum capacity of the airport is reached!" if full?
    raise "This plane has already landed!" if planes.include? plane
    raise "The plane can't land due to stormy weather!" if stormy?
    planes << plane
  end

  def take_off(plane)
    raise "The plane can't be nil!" if plane == nil
    raise "There are no planes at the airport for take off!" if empty?
    raise "This plane is already flying!" unless planes.include? plane
    raise "The plane can't take off due to stormy weather!" if stormy?
    planes.delete(plane)
  end

  private

  def full?
    planes.length == capacity ? true : false
  end

  def empty?
    planes.length.zero?
  end

  def stormy?
    @weather.stormy == true
  end

end
