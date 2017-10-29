class Airport
  attr_accessor :landed_planes, :capacity

  def initialize
    @landed_planes = []
    @capacity = 100
  end

  def stormy?
    rand > 0.9 ? true : false
  end
end
