require_relative "airplane.rb"
require_relative "weather.rb"

class Airport
  #SETUP
  attr_reader :airport_capacity, :airplanes_on_ground, :stormy
  AIRCRAFT_HANGERS = 10

  def initialize(capacity=10, stormy_weather = Weather.new)
    @airport_capacity = capacity
    @airplanes_on_ground = []
    @stormy_weather = stormy_weather
  end

  def weather_is_stormy?
    @stormy_weather == true
  end

  #LANDING
  def land_at_airport(plane)
    raise "Sorry, airport full. Try somewhere else." if airport_full?
    raise "You can't land in stormy weather!" if weather_is_stormy?
    @airplanes_on_ground << plane
  end

  def airport_full?
    @airplanes_on_ground.count >= @airport_capacity
  end

  #TAKE OFF
  def take_off
    raise "Sorry, a non existant airplane can not take off." if @airplanes_on_ground == []
    raise "You can't take off in stormy weather!" if self.stormy==true
    @airplanes_on_ground.pop
  end


end
