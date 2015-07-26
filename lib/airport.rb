require 'plane'
class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_plane
    fail 'Inclement weather' if weather.stormy?
    @planes.delete weather.pop
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

  def weather
    @planes.reject {|plane| plane.stormy?}
  end
end
