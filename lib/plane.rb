class Plane

  attr_accessor :flying
  attr_accessor :landed

  def initialize
    @flying = true

  end

  def flying?
    flying
  end

  def land
    self.flying = false
  end

  def landed?
    not flying
  end

  def take_off
    self.flying = true
  end




end
