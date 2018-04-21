class Plane
  attr_reader :status

  def landed
    @status = :at_airport
  end

end
