class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land (plane)
    planes << plane
    plane
  end

end
