# frozen_literal_string: true

require 'plane'
require 'weather'

class Airport
  DEFAULT_CAPACITY = 3

  attr_reader :hanger

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise 'Airport is full' if hanger.count >= @capacity
    check_weather('landing')

    hanger.push(plane)
  end

  def take_off(plane)
    raise 'Plane not in airport' unless hanger.include?(plane)
    check_weather('take off')

    hanger.delete(plane)
    'the plane is now airborn'
  end

  private

  def check_weather(action)
    raise "#{action} prevented, weather is stormy" if @weather.rare_stormy_weather?
  end
end
