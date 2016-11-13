require './lib/plane.rb'
require './lib/weather.rb'


class Airport
  attr_reader :landed_planes, :airborne_planes

  def initialize
    @landed_planes = []
    @airborne_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def take_off
    @airborne_planes << @landed_planes.shift
  end
end
