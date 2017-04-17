require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 6
  attr_reader :terminal, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @terminal = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail 'cannot land' if :bad_weather?
    @terminal << plane; return 'landed safely'
  end

  def take_off
    fail 'cannot take off' if :bad_weather?
    @terminal.pop; return 'take off successful'
  end

  private

  def bad_weather?
    @weather.stormy?
  end

end
