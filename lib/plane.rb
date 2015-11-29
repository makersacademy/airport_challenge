require_relative 'weather'

class Plane
  attr_reader :on_ground

  def land
    fail "It's too stormy to take off today" if Weather.new.current_weather == :stormy
    @on_ground = true
  end

  def take_off
    fail "It's too stormy to take off today" if Weather.new.current_weather == :stormy
    @on_ground = false
  end

end
