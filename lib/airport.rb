require_relative 'plane'

class Airport
  attr_accessor :hangar
  def initialize
    @hangar = []
  end

  def release_plane plane
    fail 'Airport empty' if empty?
    @hangar.pop
    plane.release_plane
  end

  def land_plane plane
    fail 'Airport full' if full?
    plane.land_plane
    @hangar << plane
  end

  private

  attr_reader :hangar

  def full?
  @hangar.count >= 6
  end

  def empty?
  @hangar.empty?
  end
end
