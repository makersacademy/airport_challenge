require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
  end

  def full?
    @planes.count == @capacity ? (raise "Airport is full, cannot land") : false
  end

end
