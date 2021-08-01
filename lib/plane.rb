class Plane
  attr_reader :plane, :airborne

  def initialize(plane = :LX810, airborne = true )
    @plane = plane
    @airborne = airborne
  end

  def flying?
    @airborne
  end

  def land
    @airborne = true
  end

  def offtake
    @airborne = false
  end
end
