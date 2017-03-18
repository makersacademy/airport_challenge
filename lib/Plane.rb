class Plane

  def initialize
    @flying = true
  end

  def flying?
    flying
  end

  def take_off
    self.flying = true
  end

  def land
    self.flying = false
  end

  private

  attr_accessor :flying
end
