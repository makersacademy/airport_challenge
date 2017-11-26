require_relative 'Airport'

class Plane

  attr_reader :status

  def initialize
    @status = "In the air"
  end

  def land(airport)
    raise "The airport is not expecting that plane" if !airport.plane_expected?(self)
    raise "Plane is already on the ground" if @status != "In the air"
    @status = airport
  end

  def takeoff
    raise "Plane is already in the air" if @status == "In the air"
    raise "The plane is not ready to take off" if !@status.on_runway?(self)
    @status = "In the air"
  end





end
