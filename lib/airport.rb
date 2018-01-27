# frozen_string_literal: true
require_relative 'plane'
# Airport class
class Airport
  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes << plane
  end

  def fly_plane
    @landed_planes.pop
  end
end
