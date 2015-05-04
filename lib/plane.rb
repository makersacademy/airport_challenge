
require_relative 'airport'

class Plane
  attr_accessor :status
  def initialize
    @status = 'flying'
  end

  def release_plane
    @status = 'flying'
  end

  def land_plane
    @status = 'landed'
  end

end
