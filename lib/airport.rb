# frozen_string_literal: true

require_relative 'plane.rb'
# rubocop demanded comment line
class Airport
  attr_reader :airport_hangar, :total_capacity, :remaining_capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hangar = []
    @total_capacity = capacity
    @remaining_capacity = capacity
  end

  def arrivals(plane)
    @airport_hangar << plane if @airport_hangar.count < DEFAULT_CAPACITY
    @remaining_capacity -= 1
    "#{plane} has arrived!"
  end

  def departures(plane)
    @airport_hangar.delete(plane)
    @remaining_capacity += 1
    "#{plane} has departed!"
  end
end
