class Airport
  def initialize
    @plane_storage = []
  end

  def land(plane)
    @plane_storage << plane
  end

  def take_off(plane)
    @plane_storage.delete(plane)
  end
end
