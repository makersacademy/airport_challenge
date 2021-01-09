require './lib/plane'

class Airport

  attr_reader :runway
  attr_reader :capacity

  def initialize(capacity = 20)
    @runway = Array.new
    @capacity = capacity
  end

  def take_off(plane)
    return if plane.flying? == true

    weather?
    plane.in_air
    #  @hangar.pop
  end

  def land_plane(plane)
    return if plane.flying? == false || @weather == false

    full?
    plane.landed
    @runway << plane
  end

  def full?
    return if @runway.length < @capacity

    puts "Runway full: maintain holding pattern"
    false
  end

  def weather?
    "Checking weather"
    return if weather == true

    puts "Stormy weather: permission denied"
    return false
  end

  def weather
    puts "generating weather"
    if rand(1..10) > 7
      false
    end
  end

end
