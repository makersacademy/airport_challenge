require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :weather, :capacity, :plane

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'Planes cant land as the weather is too stormy' if @weather.stormy?
    fail 'This airport is full' if full?
    add_plane(plane)
  end

  def take_off
    raise 'Planes cant take off as the weather is too stormy' if @weather.stormy?
    raise 'The airport is empty' if @planes.empty?
    remove_plane(plane)
  end

  private

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.count >= capacity
  end

  def add_plane(plane)
    @planes << plane
  end

  def remove_plane(plane)
    @planes.pop
  end
end
