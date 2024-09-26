require 'weather.rb'

class Airport
  DEFAULT_AIRPORT_CAPACITY = 92

  attr_reader :hangar
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity=DEFAULT_AIRPORT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def land(plane)
    if stormy?
      raise "Cannot land: Stormy"
    elsif full?
      raise 'Airport full'
    else
      @hangar << plane
    end
  end

  def takeoff
    if stormy?
      raise "Cannot take off: Stormy"
    else
      @hangar.pop
    end
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def stormy?
    @weather.forecast == 7
  end
end
