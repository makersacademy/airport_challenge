class Airport
  attr_reader :plane

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end
end
