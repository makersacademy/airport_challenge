class Airplane
  attr_reader :in_flight
  def initialize 
    @in_flight = false
  end

  def in_flight?
    @in_flight
  end 

  def take_off
    raise StandardError 'Airplane is already in flight' if in_flight?
    @in_flight = true 
  end

  def land_airplane
    raise StandardError 'Airplane is not in flight' if !in_flight?
    @in_flight = false 
  end 
end 
