# frozen_string_literal: true

require_relative 'plane.rb'
require_relative 'weather.rb'
# airport class
class Airport
  attr_reader :airport_hangar, :capacity, :taxied_planes, :weather
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hangar = []
    @capacity = capacity
    @taxied_planes = 0
    @weather = Weather.new
  end

  def landing(plane)
    raise 'the weather is too bad for landing!' if stormy?
    raise 'this plane has already landed!' if airport_hangar.include?(plane)
    raise 'the airport is full!' if full? # boolean return
    airport_hangar << plane
    @taxied_planes += 1
    "#{plane} has landed!"
  end

  def taking_off(plane)
    raise 'the weather is too bad for taking-off!' if stormy?
    airport_hangar.delete(plane)
    @taxied_planes -= 1
    "#{plane} has taken-off!"
  end

  private

  def full?
    airport_hangar.count >= capacity
  end

  def stormy?
    @weather.weather_forecast
  end
end
