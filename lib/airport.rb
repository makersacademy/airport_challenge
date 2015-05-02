require_relative 'plane'

class Airport
  def initialize
    @hangar = []
  end

  def release_plane
    fail 'Airport empty' if @hanger.empty?
    @hangar.pop
  end

  def land_plane
    fail 'Airport full' if @hangar.count >= 6
    @hangar = plane
  end
end
