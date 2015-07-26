require 'plane'
class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @plane = @planes.shuffle.pop
  end

  def release_plane
    fail 'Plane not at airport' if planes_landed.empty?
    @planes.delete planes_landed.pop
  end

  def dock_plane
    fail 'Airport full' if full?
    @planes << plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def planes_landed
    @planes.select { | plane | plane.landed? }
end
