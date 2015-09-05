require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 150
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_plane
  end

  def receive_plane
  end

  def bad_weather
  end

  def land_bad_weather
  end

  def land_now(plane)
    fail 'Airport full. Can not receive more planes.' if full?
    @planes << plane
  end

  def take_off
    fail 'No planes at airport' if empty?
    @planes.pop
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
