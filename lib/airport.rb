require './lib/plane'

class Airport

  attr_reader :runway
  attr_reader :capacity
  attr_reader :weather
  attr_reader :runway_check

  def initialize(capacity = 20)
    @runway = Array.new
    @capacity = capacity
    @weather = 1
    @runway_check = false
  end

  def add_plane(plane)
    return if full? == true

    @runway << plane
  end

  def take_off(plane)
    return unless @runway.include?(plane)
    return if plane.flying? == true || weather? == false

    puts "It's a fine day with clear skies - ready for take off"
    @runway.delete(plane)
    plane.in_air
  end

  def land_plane(plane)
    return if plane.flying? == false || full? == true || weather? == false

    puts "Runway is clear for landing"
    plane.landed
    @runway << plane
  end

  def full?
    return if @runway.length < @capacity

    puts "Runway is full"
    true
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
