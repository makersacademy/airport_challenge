class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def gone?(plane)
    planes.none?(plane)
  end
end
