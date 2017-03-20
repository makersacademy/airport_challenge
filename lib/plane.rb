class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    flying
  end

  def plane_lands
    self.flying = false
  end

  def plane_takes_off
    self.flying = true
  end

  private

  attr_writer :flying

end
