require 'plane'
require 'weather'

class Airport

  include Weather
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    raise 'airport is full' if full?
    @planes << plane
  end

  def take_off plane
    @planes.delete(plane)
  end

  private

  def full?
    planes.count == capacity
  end

end
