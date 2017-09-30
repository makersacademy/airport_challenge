require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "Sorry, no planes!" if @planes.empty?
    @planes.pop
  end

end
