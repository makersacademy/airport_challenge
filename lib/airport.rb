class Airport
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end
end
