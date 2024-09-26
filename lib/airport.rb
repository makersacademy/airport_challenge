class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 2

  def initialize(_capacity = DEFAULT_CAPACITY)
    @planes = []
    return 'full' unless airport.planes.count <= Airport::DEFAULT_CAPACITY
  end

end
