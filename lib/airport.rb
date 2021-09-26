# frozen_literal_string: true

require 'plane'
require 'weather'

class Airport
  attr_reader :hanger

  def initialize(weather, capacity = 3)
    @weather = weather
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise 'Airport is full' if hanger.count >= @capacity
    raise 'landing prevented, weather is stormy' if @weather.rare_stormy_weather?

    hanger.push(plane)
  end

  def take_off
    raise 'take off prevented, weather is stormy' if @weather.rare_stormy_weather?
    hanger.pop
    'the plane is now airborn'
  end
end
