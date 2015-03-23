require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    planes << plane
  end

  def full?
    planes_count >= @capacity
  end

  def runway
    @runway ||= []
  end
end
