class Plane

  attr_reader :in_flight, :landed

  def land
    raise "The plane has already landed" if @landed == true
    @in_flight = false
    @landed = true
  end

  def take_off
    raise "The plane is already in flight" if @in_flight
    @in_flight = true
    @landed = false
  end

end
