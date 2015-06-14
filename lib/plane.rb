class Plane

  attr_accessor :flying

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



end
