require "./lib/weather.rb"
require "./lib/airplane.rb"

class Airport
  attr_reader :airport_capacity, :airplanes_on_ground

  AIRCRAFT_HANGERS = 10

  def land_at_airport(plane = Airplane.new)
    raise "Sorry, airport full. Try somewhere else." if airport_full?
    raise "You can't land in stormy weather!" if stormy_at_airport?
    plane.landed
    @airplanes_on_ground << plane
  end

  def take_off
    raise "Sorry, a non existant airplane can not take off." if @airplanes_on_ground.empty?
    raise "You can't take off in stormy weather!" if stormy_at_airport?
    airplane_taken_off = @airplanes_on_ground.pop
    airplane_taken_off.taken_off
    @airplanes_on_ground.push(airplane_taken_off)
    @airplanes_on_ground.pop
  end


  private

  def initialize(capacity=AIRCRAFT_HANGERS)
    @airport_capacity = capacity
    @airplanes_on_ground = []
  end

  def stormy_at_airport?
    Weather.new.stormy?
  end

  def airport_full?
    @airplanes_on_ground.count >= @airport_capacity
  end

end
