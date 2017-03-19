require_relative 'airplane'

class Airport

  def initialize
    @landed_planes = []
  end

  def land_plane(airplane)
    airplane.landed?
    landed_planes << airplane
  end

  def take_off
    landed_planes.pop
  end

private

attr_reader :landed_planes

end
