require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :stationed_planes, :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @stationed_planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Weather too stormy to land" if @weather.stormy?
    raise "That plane has already landed" if @stationed_planes.include?(plane)
    @stationed_planes << plane
  end

  def take_off(plane)
    raise "Weather too stormy to take off" if @weather.stormy?
  #  raise "That plane is not not stationed in this airport" unless @stationed_planes.include?(plane)
    @stationed_planes.delete(plane)
    plane
  end

  private
  def full?
    @stationed_planes.length >= @capacity
  end

  def includes_plane
    @stationed_planes.include?(plane)
  end
end
