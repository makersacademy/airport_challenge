# frozen_string_literal: true

require_relative 'plane.rb'
# top-level class comment thing
class Airport
  attr_reader :airport_hangar

  def initialize
    @airport_hangar = []
  end

  def arrivals(plane)
    @airport_hangar << plane
    "#{plane} has landed!"
  end

  def departures(plane)
    @airport_hangar.delete(plane)
    "#{plane} has taken off!"
  end
end
