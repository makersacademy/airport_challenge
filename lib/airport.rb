require_relative 'plane'

class Airport
  attr_reader :plane
  attr_writer :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @plane = plane
    @hangar << plane

  end

  def take_off
    fail 'no planes available' if empty?
    @hangar.pop
  end

  def empty?
    @hangar.empty?
  end

end
