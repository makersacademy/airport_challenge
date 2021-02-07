require_relative './plane.rb'

class Airport
  attr_reader :plane, :hangar
  def hangar
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
  end
end
