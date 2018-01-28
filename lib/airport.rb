# frozen_string_literal: true

require_relative 'plane.rb'
require_relative 'weather.rb'
# top-level class comment thing
class Airport
  attr_reader :airport_hangar, :weather

  def initialize
    @airport_hangar = []
    @weather = Weather.new
  end

  def arrivals(plane)
    @airport_hangar << plane
    "#{plane} has landed!"
  end

  def departures(plane)
    raise 'the weather is too bad!' if stormy?
    @airport_hangar.delete(plane)
    "#{plane} has taken off!"
  end

  private

  def stormy?
    weather.stormy?
  end
end
