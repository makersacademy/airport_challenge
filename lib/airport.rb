class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def park_plane(plane)
    raise "The airport is full." if @capacity == @planes.count
    @planes << plane
  end

  def unpark_plane(plane)
    raise "No such plane in the airport." unless @planes.include? plane
    @planes -= [plane]
  end

end
