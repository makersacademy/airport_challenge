require_relative 'airport'

class Airplane

attr_reader :in_flight

  def initialize
    @in_flight = true
  end

  def in_flight?
    @in_flight
  end

  def take_off
    @in_flight = true
  end

  def land
    @in_flight = false
  end

end
