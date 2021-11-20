require_relative 'plane'

class Airport
  attr_reader :airplanes

  def initialize
    @airplanes = []
  end

  def land_plane(plane)
    @airplanes << plane
  end

  def take_off
    @airplanes.pop
  end
end
