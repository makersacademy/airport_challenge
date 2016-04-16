class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def accept plane
    @planes << plane
  end
end