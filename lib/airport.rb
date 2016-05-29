class Airport

  attr_reader :stored_planes

  def initialize
    @stored_planes = []
  end

  def full?
  end

  def store(plane)
    @stored_planes << plane
  end

end