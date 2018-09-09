require_relative 'weather.rb'
require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    raise 'This plane cannot take off as it has not landed' unless plane.landed?
    raise 'Cannot take off, too stormy.' if stormy?
    plane.landed = false
    @planes.delete(plane)
  end

  def confirm_takeoff(plane)
    !@planes.include?(plane)
  end

  def land(plane)
    raise 'Cannot land, too stormy.' if stormy?
    raise 'Cannot land, airport is full.' if full?
    raise 'Plane has already landed.' if plane.landed?
    plane.landed = true
    @planes << plane
  end

  def stormy?
    Weather.new.stormy
  end

  def full?
    @planes.count >= @capacity
  end

end
