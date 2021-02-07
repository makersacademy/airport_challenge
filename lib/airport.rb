require_relative './plane.rb'

class Airport
  attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off
    plane = @hangar.pop
    "#{plane} has left the hangar"
  end

end
