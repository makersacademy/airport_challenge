# frozen_string_literal: true

# require_relative 'weather.rb'

class Airport
  attr_reader :airport_hangar, :capacity
  DEFAULT_CAPACITY = 5

  def initialize
    @airport_hangar = []
    @capacity = []
  end

  def arrivals(plane)
    @airport_hangar << plane
    "#{plane} has arrived!"
  end

  def departures(plane)
    # raise 'the weather is too bad!' if stormy?
    @airport_hangar.delete(plane)
    "#{plane} has departed!"
  end
end

#   private
#
#   def stormy?
#     weather.storm_forecast
#   end
# end
