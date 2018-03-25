class Airport

  DEFAULT_CAPACITY = 30
  
  attr_accessor :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def accept_plane plane
    raise "No landing- stormy weather!" if stormy?
    @planes << plane
  end

  def stormy?
    rand(2) == 1
  end

end
