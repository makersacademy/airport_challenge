class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise("Plane has already landed") if @hangar.include?(plane)
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    raise("Plane is not at airport") if !@hangar.include?(plane)
    @hangar.delete(plane)
  end
end
