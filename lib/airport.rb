require './lib/plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
  end

  def takeoff
    fail 'Unable to takeoff' if empty?
  end

  private

  def empty?
    @hangar.empty?
  end

end
