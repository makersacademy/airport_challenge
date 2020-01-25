require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "No landings permitted when stormy" if stormy?
    raise "Plane already in airport" if @planes.include?(plane)
    raise "Airport full" if full?

    @planes << plane
  end

  def take_off(plane)
    raise "No takeoffs permitted when stormy" if stormy?
    raise "No planes" if empty?
    
    @planes.delete(plane)
  end

  private

  def stormy?
    Weather.new.stormy?
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= @capacity
  end
end
