class Airplane

attr_reader :airport

  def initialize
    @in_flight = true
  end

  def landed(airport)
    raise "Plane has already landed!" unless @in_flight
    @in_flight = false
    @airport = airport
  end

  def taken_off
    raise "Plane has already taken off!" if @in_flight
  end

end
