require "./lib/weather.rb"
require "./lib/airplane.rb"

class Airport
  #SETUP
  attr_reader :airport_capacity, :airplanes_on_ground

  AIRCRAFT_HANGERS = 10

  def initialize(capacity=AIRCRAFT_HANGERS)
    @airport_capacity = capacity
    @airplanes_on_ground = []
  end

  def stormy_at_airport?
    Weather.new.stormy?
  end

  #LANDING
  def land_at_airport(plane = Airplane.new)
    raise "Sorry, airport full. Try somewhere else." if airport_full?
    raise "You can't land in stormy weather!" if stormy_at_airport?
    plane.landed
    @airplanes_on_ground << plane

  end

  def airport_full?
    @airplanes_on_ground.count >= @airport_capacity
  end

  #TAKE OFF
  def take_off
    raise "Sorry, a non existant airplane can not take off." if @airplanes_on_ground == []
    raise "You can't take off in stormy weather!" if stormy_at_airport?
    @airplanes_on_ground.pop.taken_off
  end


end
