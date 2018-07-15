require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport at full capacity' if @planes.count >= 50
    @planes << plane
  end

  def launch_plane
    fail 'Airport is empty' if @planes.empty?
    @planes.pop
  end
end
