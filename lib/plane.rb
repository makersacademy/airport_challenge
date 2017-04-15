class Plane

  def docked
    self.landed = true
  end

  def has_confirmed_landing?
    landed
  end

  private

  attr_accessor :landed
end
