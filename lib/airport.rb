require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    full?
    authorization(plane, :incoming)
    store_plane(plane) unless weather_alert
  end

  def take_off(plane)
    empty?
    authorization(plane, :outgoing)
    (plane.taking_off; @planes.delete(plane)) unless weather_alert
  end

  private

  def weather_alert
    raise 'Sorry, the storm is too great!' if @weather.stormy?
  end

  def full?
    raise 'The airport is currently full.' if @planes.length >= @capacity
  end

  def empty?
    raise 'There currently are no planes available.' if @planes.empty?
  end

  def authorization(plane, direction)
    if direction == :outgoing
      raise 'This plane is not available!' unless plane.stationed?
    elsif direction == :incoming
      raise 'The plane has already landed' if plane.stationed?
    end
  end

  def store_plane(plane)
    @planes << plane
    plane.stationing
    return plane
  end
end
