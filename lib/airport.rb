class Airport

attr_reader :plane_array
attr_reader :stormy

  def initialize
    @plane_array = []
    @stormy
  end

  def land(plane)
    @plane_array << plane
  end

  def take_off(plane)
    @plane_array.delete(plane)
  end

end
