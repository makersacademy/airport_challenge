require_relative 'plane'
require_relative 'weather'

class Airport

  attr_writer :hangar
  attr_reader :instance_of_weather

  def initialize
    @hangar = []
    @instance_of_weather = Weather.new
  end

  def land(plane)
    @plane = plane
    @hangar << plane
  end

  def take_off
    fail 'no planes available' if empty?

    fail 'cant fly in storm!' if @instance_of_weather.storm?

    @hangar.pop
  end

  def empty?
    @hangar.empty?
  end

end
