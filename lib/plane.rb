class Plane

  attr_accessor :flying, :can_land

  def initialize
    @flying = true
    @can_land = false
  end

  def flying?
    flying
  end

  def can_land?
    can_land
  end

  def prepare_to_land
    self.can_land = true
  end

  def land
    self.flying = false
  end
end
