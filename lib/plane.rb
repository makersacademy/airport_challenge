class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def landed
    !flying
  end

end
