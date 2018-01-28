# frozen_string_literal: true

require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :airport_hangar, :weather

  def initialize
    @airport_hangar = []
    @weather = Weather.new
  end

  def arrivals(plane)
    @airport_hangar << plane
    puts "#{plane} has arrived!"
  end

  def departures(plane)
    # raise 'the weather is too bad!' if stormy?
    @airport_hangar.delete(plane)
    puts "#{plane} has departed!"
  end

  private

  def stormy?
    weather.storm_forecast
  end
end
