require_relative "plane"
require_relative "weather"

class Airport

  ::DEFAULT_CAPACITY = 20
  attr_reader :capacity, :hangar, :climate, :name

  def initialize(capacity = DEFAULT_CAPACITY, climate = Weather.new.meteo)
    @hangar = []
    @capacity = capacity
    @climate = climate
  end

  def land(plane)
    fail "It's too stormy, the plane cannot land" if stormy?
    fail "The airport is full" if full?
    fail "This plane has already landed." if landed?(plane)

    @hangar << plane
  end

  def take_off(plane)
    fail "It's too stormy, the plane cannot take off" if stormy?
    fail "The airport is empty" if empty?
    fail "This flight is not scheduled." unless landed?(plane)

    @hangar.delete(plane)
    announcement
  end

  private 

  def announcement
    puts "The plane has taken off and is no longer at the airport"
  end

  def full?
    @hangar.count >= @capacity
  end

  def empty?
    @hangar.empty?
  end

  def stormy? 
    @climate == "stormy"
  end

  def landed?(plane)
    @hangar.include?(plane)
  end
end
