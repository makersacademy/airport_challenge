require_relative 'plane'
# require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise 'weather is stormy' if forecast == 'stormy'
    @planes << plane
  end

  def takeoff
    raise 'weather is stormy' if forecast == 'stormy'
    @planes.pop
  end

  def forecast
    rand(5) == 2 ? 'stormy' : 'fine'
  end


end
