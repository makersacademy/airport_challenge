require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 80
  attr_reader :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land_bad_weather
    fail 'Stormy weather' if weather = :stormy
  end

  def land(plane)
    fail 'Airport full.' if full?
    planes << plane
  end

  def take_off
    fail 'No planes at airport' if empty?
    fail 'Stormy weather' if weather = :stormy
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
