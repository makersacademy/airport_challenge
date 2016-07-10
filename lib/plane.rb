class Plane
#understands when planes are in flight or landed
attr_reader :airbourne

  def initialize
    @airbourne = true
  end

  def landed
    @airbourne = false
  end

  def flying
    @airbourne = true
  end

end
