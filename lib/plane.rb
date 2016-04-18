class Plane

  def initialize
    @flying = true
  end

  def land
    fail 'Plane already landed!' unless flying?
    self.flying = false
  end

  def take_off
    fail 'Plane already flying!' if flying?
    self.flying = true
  end

  def flying?
    flying
  end

  private

  attr_accessor :flying

end