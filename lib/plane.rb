class Plane
  attr_reader :flying, :flight, :landed

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def flight
    @flying = true
  end

end
