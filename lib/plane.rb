class Plane
  attr_reader :docked

  def initialize
    @docked = false
  end

  def landed
    @docked = true
  end

  def flying
    @docked = false
  end
end