require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY=40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def landed_planes
    @landed_planes.dup
  end

  def clear_to_land(plane)
    fail 'The airport is full' if full?
    fail 'Stormy weather is preventing landing' if stormy?
    fail 'The plane has already landed at the airport' if plane.landed?
    plane.land
    @landed_planes << plane
  end

  def clear_to_takeoff
    fail 'There are no planes at the airport' if empty?
    fail 'Stormy weather is preventing takeoff' if stormy?
    @landed_planes.each_with_index do |plane, i|
      plane.takeoff
      return @landed_planes.delete_at(i)
    end
  end

  def confirm_landed(plane)
    plane.landed?
  end

  private
  def full?
    @landed_planes.size >= capacity
  end

  def empty?
    @landed_planes.size <= 0
  end

  def stormy?
    @weather.stormy?
  end
end
