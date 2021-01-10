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

    return if weather? == false
    
    puts "It's a fine day with clear skies - ready for take off"
    plane.in_air
  end

  def land_plane(plane)
    return if plane.flying? == false

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
    return if storm != true

    puts "Stormy weather: permission denied"
    false
  end

  def storm
    return true if rand(1..10) > 7

  end

end
