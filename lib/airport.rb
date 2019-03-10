require 'plane'

class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Landed"
  end

  def take_off(plane)
    @hangar.delete(plane)
    "Plane has taken off" unless confirm_take_off(plane)
  end

  private

  def confirm_take_off(plane)
    @hangar.include?(plane)
  end
end
