require_relative './plane.rb'

class Airport
  attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def allows_for_landing(plane)
    @plane = plane
  end

  def allows_for_take_off
    Plane.new
  end

end
