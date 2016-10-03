require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :stormy

  DEFAULT_CAPACITY = 35

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = (Weather.new).stormy
  end

  def full
    planes.count > capacity
  end

end
