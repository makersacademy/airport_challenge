require_relative 'plane'

class Airport
  attr_reader :plane

  # def initialize
  #   @plane
  # end

  def land_plane(plane)
    raise "Too stormy to land" if @stormy

    @plane = plane
  end

  def take_off
    raise "Too stormy to take off!" if @stormy

    @plane = nil
    "plane has left the airport"
  end

  def stormy?
    rand(1..5) == 5 ? @stormy = true : @stormy = false
  end
end
