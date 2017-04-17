require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :terminal

  def initialize
    @terminal = []
    @weather = Weather.new
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
