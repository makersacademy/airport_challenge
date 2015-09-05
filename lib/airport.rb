require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 80
  attr_reader :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def weather
    [:sunny, :stormy].shuffle.first
  end

  def land_bad_weather
    fail 'Stormy weather' if weather = :stormy
  end

  def land(plane)
    fail 'Airport full.' if full?
    planes << plane
  end

  def take_off_bad_weather
    fail 'Stormy weather' if weather = :stormy
  end

  def take_off
    fail 'No planes at airport' if empty?
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
