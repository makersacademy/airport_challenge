# frozen_string_literal: true

require_relative 'plane.rb'
# rubocop demanded comment line
class Airport
  attr_reader :airport_hangar, :total_capacity, :remaining_capacity, :weather_forecast
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hangar = []
    @total_capacity = capacity
    @remaining_capacity = capacity
    @weather = weather_forecast
  end

  def arrivals(plane)
    @airport_hangar << plane if @airport_hangar.count < DEFAULT_CAPACITY
    @remaining_capacity -= 1
    "#{plane} has arrived!"
  end

  def departures(plane)
    raise 'flights suspended due to bad weather!' if @weather['stormy']
    @airport_hangar.delete(plane)
    @remaining_capacity += 1
    "#{plane} has departed!"
  end

  private

  def weather_forecast
    %w[stormy sunny rainy clear windy].sample
  end
end
