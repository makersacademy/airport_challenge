class Plane

  def docked
    self.landed = true
  end

  def has_landed?
    landed
  end

  private

  attr_accessor :landed
end
