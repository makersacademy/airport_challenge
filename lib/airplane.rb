class Airplane
  attr_reader :in_flight
  def initialize 
    @in_flight = false
  end

  def take_off
    @in_flight = true 
  end

  def land_airplane
    @in_flight = false 
  end 
end 
