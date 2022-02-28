require './lib/plane'

class Airport
  attr_reader :plane, :DEFAULT_CAPACITY

  def initialize(capacity = 30, weather = "good")
    @plane = []
    @DEFAULT_CAPACITY = capacity
    @weather = weather
  end

  def land(plane, _weather = "good")
    stormy?
    full?
    @plane << plane
  end

  def takeoff(_weather = "good")
    stormy?
    empty?
    return @plane.pop
  end

  private

  def stormy?
    if @weather == "stormy"
        raise Exception.new "Weather is stormy, cannot land or take off atm"
    else 
        true
    end
  end

  def full?
    if @plane.size > @DEFAULT_CAPACITY
      raise Exception.new "Airport is full"
    end    
  end

  def empty?
    if @plane.empty?
      raise Exception.new "No plane yet"
    end
  end

end