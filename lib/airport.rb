class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  private

  attr_accessor :planes
  
end