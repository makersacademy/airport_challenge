require_relative "Plane"

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "Cannot land in stormy weather" if stormy?
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
