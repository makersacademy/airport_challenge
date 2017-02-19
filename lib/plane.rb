class Plane
  SPEED = 100

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

  class Concorde < Plane
    SPEED = 200

  end
