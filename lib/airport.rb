require_relative 'airplane'

class Airport

  def initialize
    @landed_planes = []
  end

  def land_plane(airplane)
    airplane.landed?
    landed_planes << airplane
  end

private

attr_reader :landed_planes

end
