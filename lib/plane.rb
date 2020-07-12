class Plane
  attr_reader :plane
  attr_accessor :flying

  def initialize
    @flying = flying
  end

  def flying?
    @flying
  end

  def in_flight
    @flying = true
  end

  def grounded
    @flying = false
  end
end
