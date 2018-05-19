require_relative 'plane'

class Airport

# OUTLOOKS = [:stormy, :fine, :fine, :fine]

attr_reader :planes

  def initialize
    @planes = []
    # @weather = weather
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end

# (weather: Weather.new)
end
