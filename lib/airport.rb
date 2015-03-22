class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def accepts(plane = '')
    @planes << plane
  end
end
