class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def set_flying
    self.flying=(true)
  end

  def set_landed
    self.flying=(false)
  end

  private

  def flying=(boolean)
    @flying = boolean
  end
end
