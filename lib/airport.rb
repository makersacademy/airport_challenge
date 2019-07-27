require_relative 'plane'
require_relative 'weather_report'


class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  attr_reader :planes, :capacity

  def land(plane)
    fail "Full capacity reached! You can not land here." if full?
    fail "Stormy weather! You can not land!!" if stormy?
    store_plane(plane)
  end

  def take_off(plane)
    fail "Stormy weather! You can not take off!!" if stormy?
    remove_plane(plane)
  end

  private

  def full?
    planes.count >= capacity
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def store_plane(plane)
    @planes << plane
  end

  def stormy?
    WeatherReport.new.stormy?
  end

end