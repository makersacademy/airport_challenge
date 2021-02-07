require './lib/weather.rb'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_space = []
    @capacity = capacity
  end

  def land(plane)
    landing_errors(plane)
    @airport_space.push(plane)
  end

  def takeoff(plane)
    takeoff_errors(plane)
    @airport_space.delete(plane)
    @airport_space
  end

  private

  def already_landed?(plane)
    @airport_space.include?(plane)
  end

  def stormy?
    report == :stormy
  end

  def full?
    fail 'Airport Full' if @airport_space.length == @capacity
  end

  def landing_errors(plane)
    raise 'Already Landed' if already_landed?(plane)
    raise 'Stormy Weather, unsafe to land' if stormy?
    raise 'Airport Full, no space to land' if full?
  end

  def takeoff_errors(plane)
    raise 'Plane not in hangar' unless already_landed?(plane)
    raise 'Stormy Weather, unsafe to take off' if stormy?
  end
end
