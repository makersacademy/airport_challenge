require "weather.rb"

class Airport

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def land(plane)
    raise "airport is full" if airport_full?
    raise "too stormy for landing" if Weather.stormy?
    @planes << plane
    "plane landed" 
  end
  
  def take_off(plane)
    raise "no available planes" if airport_empty?
    raise "too stormy for takeoff" if Weather.stormy?
    @planes.pop
    "plane left airport"
  end

  private

  def airport_full?
    true if @planes.size >= DEFAULT_CAPACITY
  end

  def airport_empty?
    true if @planes == []
  end
 
end

