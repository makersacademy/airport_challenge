require "./lib/airplane.rb"
require "./lib/weather.rb"

class Airport
  #SETUP
  attr_reader :airport_capacity, :airplanes_on_ground, :stormy
  AIRCRAFT_HANGERS = 10


  def initialize(capacity=10)
    @airport_capacity = capacity
    @airplanes_on_ground = []
    @stormy = Weather.new.stormy?
  end

  #LANDING
  def land_at_airport(plane)
    raise "Sorry, airport full. Try somewhere else." if airport_full?
    raise "You can't land in stormy weather!" if @stormy
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
