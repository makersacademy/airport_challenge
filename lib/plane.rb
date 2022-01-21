class Plane

  def initialize(in_flight = false)
    @in_flight = in_flight
  end

  def take_off
    return raise ("This plane is already in flight - it cannot take off") unless @in_flight == false

    @in_flight = true
  end

  def land
    return raise ("This plane is grounded, and doesn't need to land") unless @in_flight == true

    @in_flight = false
  end
end
