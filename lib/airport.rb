# frozen_string_literal: true

require_relative 'plane.rb'
# airport class
class Airport
  attr_reader :airport_hangar, :capacity, :taxied_planes, :weather
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hangar = []
    @capacity = capacity
    @taxied_planes = 0
    @weather = bad_weather
  end

  def landing(plane)
    raise 'the weather is too bad for landing!' if weather == 'stormy'
    raise 'this plane has already landed!' if airport_hangar.include?(plane)
    raise 'the airport is full!' if full?
    airport_hangar << plane
    @taxied_planes += 1
    "#{plane} has landed!"
  end

  def taking_off(plane)
    raise 'the weather is too bad for taking-off!' if weather == 'stormy'
    airport_hangar.delete(plane)
    @taxied_planes -= 1
    "#{plane} has taken-off!"
  end

  def bad_weather
    %w[stormy sunny rainy clear windy].sample
  end

  private

  def full?
    airport_hangar.count >= capacity
  end
end
