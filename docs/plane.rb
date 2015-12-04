class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def depart
    @flying = true
  end

end
