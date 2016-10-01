require_relative 'plane.rb'

class Airport

  attr_reader :weather

  CHANCE_OF_SUN = 0.9

  def initialize
    @weather = 'sunny'
  end

  def check_weather
    if rand < Airport::CHANCE_OF_SUN
      @weather = 'sunny'
    else
      @weather = 'stormy'
    end
    @weather
  end

  def land(plane)
    check_weather
    fail "Can't land when stormy" if @weather == 'stormy'
    plane.on_ground = true
  end

  def takeoff(plane)
    check_weather
    fail "Can't takeoff when stormy" if @weather == 'stormy'
    plane.on_ground = false
  end

end
