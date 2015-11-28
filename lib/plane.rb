class Plane
  attr_reader :flying

  def initialize
    @flying = nil
  end

  def land
    @flying = false
  end

  def landed?
    !@flying
  end

end
