require_relative 'plane'
require_relative 'weather'

class Airport
  CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off
    raise "#{self.class.name} empty" if empty?
    planes.pop
  end

  def land(plane)
    raise "#{self.class.name} full" if full?
    planes << plane
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  private
  attr_reader :planes

end
