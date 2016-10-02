require_relative 'airport'

class Plane < Airport

  def initialize
    @status = :in_flight
  end

  def land
    #fail "Cannot land: plane is already grounded" if @status == :landed
    @status = :landed
  end

  def take_off
    #fail "Cannot takeoff: plane is already in the air" if @status == :in_flight
    @status = :in_flight
  end

  def status
    @status
  end
end
