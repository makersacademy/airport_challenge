class Airport
  def initialize
    @planes_landed = []
  end
  def land plane
    @planes_landed << plane
  end
  def take_off planes
    @planes_landed.pop
  end
  def planes_landed
    @planes_landed
  end
end
