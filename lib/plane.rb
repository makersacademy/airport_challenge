class Plane

  attr_reader :in_flight, :in_airport

  def initialize
    @in_flight = true
  end

  def flying
    @in_flight = true
  end

  def land
    @in_flight = false
    # Z@in_airport = true
  end

end
