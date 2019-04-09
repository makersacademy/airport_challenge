require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :hangar
  attr_reader :instance_of_weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @instance_of_weather = Weather.new
  end

  def land(plane)
    fail 'cant land in storm' if @instance_of_weather.storm?

    fail 'hangar full' if full?

    @hangar << plane
  end

  def take_off
    fail 'no planes available' if empty?

    fail 'cant fly in storm!' if @instance_of_weather.storm?

    @hangar.pop
  end

private

  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.count >= capacity
  end

end
