class Airport
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def depart(plane)
    @hangar.delete(plane)
  end
end
