require_relative './plane.rb'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def allows_for_landing(plane)
    @hangar << plane
  end

  def allows_for_take_off(plane)
    @hangar.delete(plane)
  end

end
