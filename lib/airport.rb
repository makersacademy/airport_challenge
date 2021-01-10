require './lib/plane'

class Airport

  attr_reader :runway
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = 20)
    @runway = Array.new
    @capacity = capacity
    @weather = 1
  end

  def plane
    plane = Plane.new
  end

  def take_off(plane)
    return if plane.flying? == true || weather? == false

    puts "It's a fine day with clear skies - ready for take off"
    plane.in_air
  end

  def land_plane(plane)
    return if plane.flying? == false || weather? == false

    full?
    puts "Runway is clear for landing"
    plane.landed
    @runway << plane
  end

  def full?
    return if @runway.length < @capacity

    puts "Runway is full"
    false
  end

  def weather?
    return if storm != true

    puts "Stormy weather: permission denied"
    false
  end

  def storm
    @weather = rand(1..10)
    return true if @weather > 7
  end

end
