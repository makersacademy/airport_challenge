class Plane
  attr_reader :plane, :airborne

  def initialize(plane = :LX810, airborne = true )
    @plane = plane
    @airborne = airborne
  end

  def flying?
    @airborne
  end

  def landing
    @airborne = false
  end

  def offtake
    @airborne = true
  end
end
