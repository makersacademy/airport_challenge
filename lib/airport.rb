require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Unable to land' if unsafe || full?
    @hangar << plane
    return 'Plane landed safely'
  end

  def takeoff
    fail 'Unable to takeoff' if empty? || unsafe
    @hangar.pop
    return 'Plane takeoff succesful'
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end

  def unsafe(weather = Weather.new)
    weather.random_condition == :stormy ? true : false
  end

end
