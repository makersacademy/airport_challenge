
require_relative 'airport'

class Plane
  attr_accessor :plane_status
  def initialize
    @plane_status = 'flying'
  end

  def release_plane
    @status = 'flying'
  end

  def land_plane
    @status = 'landed'
  end

end
