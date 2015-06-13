class Plane

  attr_accessor :flying, :can_land, :can_take_off

  def initialize
    @flying = true
    @can_land = false
    @can_take_off = false
  end

  # def flying?
  #   flying
  # end

  # def can_land?
  #   can_land
  # end

  def prepare_to_land
    self.can_land = true
  end

  def land
    self.can_land = false
    self.flying = false
  end

  # def can_take_off?
  #   can_take_off
  # end

  def prepare_to_take_off
    self.can_take_off = true
  end
end
