class Plane

  attr_reader :in_flight, :landed

  def land
    if @landed == true
      raise "The plane has already landed"
    else
      @in_flight = false
      @landed = true
    end
  end

  def take_off
    if @in_flight
      raise "The plane is already in flight"
    else
      @in_flight = true
      @landed = false
    end
  end

end
