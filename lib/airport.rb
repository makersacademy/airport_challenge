class Airport
  attr_accessor :landed_planes

  def initialize
    @landed_planes = []
  end

  def stormy?
    rand > 0.9 ? true : false
  end
end
