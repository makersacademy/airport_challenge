class Airport

  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def land(plane)
    @plane_list << plane
  end

end
