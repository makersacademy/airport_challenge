require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = Weather.new
  end

  def land_plane(plane)
    fail "Hanger is full" if full?
    fail "Weather is stormy" if stormy?
    hanger << plane
  end

  def take_off_plane(plane)
    true
  end

  private

  attr_reader :hanger, :weather

  def full?
    hanger.length >= @capacity
  end

  def stormy?
    weather.stormy?
  end
end
