require_relative 'weather'
require_relative 'airport'

class Plane
  attr_reader :on_ground

  def land
    fail "It's too stormy to take off today" if Weather.new.current_weather == :stormy
    fail "The airport is full" if Airport.new.full?
    @on_ground = true
  end

  def take_off
    fail "It's too stormy to take off today" if Weather.new.current_weather == :stormy
    @on_ground = false
  end

end
