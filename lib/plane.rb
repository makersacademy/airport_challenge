class Plane

  def initialize
    @status = :stationed
  end

  def stationed?
    @status == :stationed
  end

  def take_off
    @status = :in_the_air
  end

end

# take off to specific airport
