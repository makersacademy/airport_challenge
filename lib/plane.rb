class Plane
  attr_reader :status

  def flying
    @status = :at_airport
  end

end
