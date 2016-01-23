require_relative 'airplane.rb'

class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def set_capacity(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def planes
    @planes
  end

  def land(plane)
    raise "This airport is full!" if full?
    @planes << plane
    @planes.flatten
  end

  def take_off(plane)
    @planes.pop
  end

  private
  def full?
    @planes.count >= set_capacity
  end
end
