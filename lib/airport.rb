require_relative 'plane'
require_relative 'weather'

class Airport

  attr_writer :hangar
  attr_reader :instance_of_weather

  def initialize(capacity)
    @capacity = capacity 
    @hangar = []
    @instance_of_weather = Weather.new
  end

  def land(plane)
    fail 'cant land in storm' if @instance_of_weather.storm?
    fail 'hangar full' if full?
    @plane = plane
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
    @hangar.count >= 10
  end

end
