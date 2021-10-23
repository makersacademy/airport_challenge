class Airport

  attr_reader :planes, :capacity

  def initialize(capacity=3)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    raise 'The airport is full.' unless @planes.length == 0
    planes << plane
  end

end