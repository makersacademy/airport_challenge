require 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :landing_area, :airport_space

  def initialize(airport_space = DEFAULT_CAPACITY)
    fail "You did not specify a number for your airport spaces!" unless airport_space.is_a? Integer
    @airport_space = airport_space
    @landing_area = Array.new(airport_space) { Plane.new }
  end

  def accept_landing(plane)
    fail "Not a plane, please do not land!" unless plane.instance_of?(Plane)
    fail "Airport is full!" if (@landing_area.length == @airport_space)
    @landing_area.push(plane)
  end


end
