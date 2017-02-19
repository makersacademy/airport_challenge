class Plane
  attr_reader :in_flight, :in_airport

  def flying
    @in_flight = true
    @in_airport = false
  end

  def landed
    @in_flight = false
    @in_airport = true
  end

end
