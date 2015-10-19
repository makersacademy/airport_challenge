class Plane

  def initialize
    @flying = true
  end

  def take_off
    fail 'already flying' if flying?
    self.flying = true
  end
  
  def land
    fail 'already landed' unless flying?
    self.flying = false
  end

  private

  attr_writer :flying

  def flying?
    @flying 
  end

end
