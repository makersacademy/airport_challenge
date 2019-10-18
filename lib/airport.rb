class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

  def get_permission_to_take_off(plane)
    @planes.index(plane)
  end
end