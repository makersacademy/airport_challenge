class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    flying
  end

  def land
    self.flying = false
  end

  def take_off
    self.flying = true
  end

  private
  attr_writer :flying

end
