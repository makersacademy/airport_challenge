class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_landing(plane)
    @planes << plane
  end
end
