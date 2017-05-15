class Plane

  def initialize
    @status = :in_the_air
  end

  def stationed?
    @status == :stationed
  end

  def taking_off
    @status = :in_the_air
  end

  def stationing
    @status = :stationed
  end
end

# take off to specific airport
