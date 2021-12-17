class Plane

  def initialize(flying = true)
    @flying = flying
  end
  
  def flying?()
    return @flying
  end
  
  def land()
    raise 'I am already landed!' unless self.flying?

    @flying = false
  end
end
