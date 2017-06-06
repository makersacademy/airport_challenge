class Plane

  def initialize
    @status = :airborne
  end

  def stationed?
    @status == :stationed
  end

  def taking_off
    @status = :airborne
  end

  def stationing
    @status = :stationed
  end
end

# take off to specific airport
