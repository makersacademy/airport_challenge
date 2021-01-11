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
    return if full? == true || plane.at_airport? == true

    @runway << plane
    plane.added_to_airport
  end

  def take_off(plane)
    unless @runway.include?(plane)
      puts "This plane is not on the runway"
      return
    end

    return if plane.flying? == true || weather? == false

    puts "It's a fine day with clear skies - ready for take off"
    @runway.delete(plane)
    puts @runway
    puts @runway.length
    plane.in_air
  end

  def land_plane(plane)
    if plane.flying? == false
      puts "This plane is already on a runway"
      return
    end
    return if full? == true || weather? == false

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
