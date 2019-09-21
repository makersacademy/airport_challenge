require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise "Too stormy to land" if @stormy

    @planes << plane
  end

  def take_off
    raise "Too stormy to take off!" if @stormy

    @planes = nil
    "plane has left the airport"
  end

  def stormy?
    rand(1..5) == 5 ? @stormy = true : @stormy = false
  end
end
