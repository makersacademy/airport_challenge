class Plane

  attr_reader :landed, :in_transit

  def land
    @in_transit = false
    @landed = true
  end

  def take_off
    @in_transit = true
    @landed = false
  end

end
