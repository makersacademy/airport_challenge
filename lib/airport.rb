require_relative 'plane'

class Airport

  attr_reader :airfield

  def initialize
    @airfield  = []
  end

  def land(plane)
    plane.land
    @airfield << plane
  end

  def confirm_landing(plane)
    airfield.include?(plane) ? true : false
  end

  def dispatch(plane)
    fail "This plane is not in the airfield" unless @airfield.include?(plane)
    @airfield.delete_if { |pl| pl == plane }
    plane.take_off
    plane
  end

  def confirm_dispatch(plane)
    airfield.include?(plane) ? false : true
  end

end
