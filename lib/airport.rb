require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :capacity, :hangar_planes

  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar_planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport full! No landing permitted." if full?
    raise "Weather is stormy. No landing is allowed!" if stormy?
    @hangar_planes << plane
  end

  def take_off(plane)
    raise "Weather is stormy. No takeoff is allowed!" if stormy?
    @hangar_planes.delete(plane) if @hangar_planes.include?(plane)
  end

  def stormy? 
    @weather == :stormy?
  end

  private

  def full?
    @hangar_planes.size >= @capacity
  end

  
end
