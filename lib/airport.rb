class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def full?
    return @planes.length >= DEFAULT_CAPACITY
  end
end