class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing(plane)
    raise 'The airport is full.' unless @planes.length == 0
    planes << plane
  end

end