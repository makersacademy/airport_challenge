require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :hangar, :weather
  DEFAULT_CAPACITY = 20

  def initialize(weather: Weather.new)
    @hangar = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Airport is full, cannot land the plane' if full
    fail 'Landing cancelled due to bad weather' if weather.stormy?
    @hangar << plane
  end

  def take_off(plane)
    fail 'Take off cancelled due to bad weather' if weather.stormy?
    @hangar.delete(plane)
    status
  end

  def status
    if @hangar.count < 2
      "#{@hangar.count} plane at the airport"
    else
      "#{@hangar.count} planes at the airport"
    end
  end

  def full
    @hangar.count == @capacity
  end
end
