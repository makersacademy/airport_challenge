class Airport
  attr_reader :spaces

  def initialize
    @spaces = []
  end

  def land(plane)
    spaces << plane
  end
end
