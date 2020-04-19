require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :capacity, :weather

  def initialize(capacity = 10)
    @capacity = capacity
    @plane = Array.new(capacity, Plane.new)
    @weather = ""
  end

  def take_off(plane)
    raise "This plane (#{plane}) has already taken off" if @plane.include?(plane) == false

    @plane.delete(plane)
    "#{plane} has taken off and is no longer at #{self}"
  end

  def land(plane)
    raise "This plane (#{plane}) has already landed" if @plane.include?(plane)
    raise "This airport (#{self}) has reached maximum capacity." if @capacity == 50

    # @weather = WeatherGenerator.new.random_weather
    # p @weather

    # raise "It is stormy so unable to land at this airport" if @weather == "stormy"
    @plane.push(plane)
    "#{plane} has landed"
  end

end
