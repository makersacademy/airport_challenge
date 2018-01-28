require_relative "Plane"
require_relative "Weather"

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    raise "Cannot take off in stormy weather" if stormy?
    @hangar.delete(plane)
  end

  private

  def stormy?
    rand(10) < 2
  end

end
