class Plane

  def initialize
    @flying = false
  end

  def flying?
    flying
  end

  def take_off
    self.flying = true
  end

  private
  
  attr_accessor :flying
end
