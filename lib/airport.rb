class Airport
  attr_reader :planes, :capacity

  def initialize
    @capacity = 20
    @planes = []
  end

  def instruct_landing(plane)
     raise 'Cannot land. Airport is full' if @planes.size >= @capacity
    @planes << plane
  end

  def instruct_take_off(plane)
  end

end
