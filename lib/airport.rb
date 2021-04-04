require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :hangar, :climate

  def initialize(capacity = DEFAULT_CAPACITY, climate = Weather.new.meteo)
    @hangar = []
    @capacity = capacity
    @climate = climate
  end

  def land(plane)
    fail "The airport is full" if full?
    fail "It's too stormy, the plane cannot land" if stormy?

    @hangar << plane
  end

  def take_off(plane)
    fail "It's too stormy, the plane cannot take off" if stormy?
    
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

#   def empty?
#     @hangar.empty?
#   end

  def stormy? 
    @climate == "stormy"
  end
end
