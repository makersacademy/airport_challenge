class Plane
  attr_reader :status

  def landed
    @status = :at_airport
  end

  def flying
    @status = :in_the_air
  end

end
