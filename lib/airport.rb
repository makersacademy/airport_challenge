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
    @weather = weather_forecast
  end

  def arrivals(plane)
    raise 'this plane has already arrived!' if @airport_hangar.include?(plane)
    raise 'the airport is full!' if @airport_hangar.count >= total_capacity
    # raise 'flights suspended due to bad weather!' if @weather['stormy']
    @airport_hangar << plane
    @remaining_capacity -= 1
    "#{plane} has arrived!"
  end

  def departures(plane)
    raise 'this plane has already departed!' unless @airport_hangar.include?(plane)
    # raise 'flights suspended due to bad weather!' if @weather['stormy']
    @airport_hangar.delete(plane)
    @remaining_capacity += 1
    "#{plane} has departed!"
  end

  private

  def weather_forecast
    %w[stormy sunny rainy clear windy].sample
  end
end
