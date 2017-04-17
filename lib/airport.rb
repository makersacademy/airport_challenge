## This class has responsibility for creating an airport with the
## capacity for a certain number of planes
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(n=DEFAULT_CAPACITY)
    @planes = [ ]
    @capacity = n
  end

  def full?
    @planes.count >= @capacity
  end
end
