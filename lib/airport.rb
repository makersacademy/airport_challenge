require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  attr_accessor :capacity, :conditions

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    weather = generate_weather # Generate weather with new aiport
    @conditions = weather # Assign weather result to attr
  end

  def land_plane(plane)
    fail 'Hangar is full' if full?
    fail 'Weather is too dangerous' if conditions == "stormy"

    plane.landed = true
    hangar << plane
  end

  def take_off(plane)
    fail 'Weather is too dangerous' if conditions == "stormy"
    fail 'That plane is not in the hangar' if plane.landed == false
    
    hangar.delete(plane) if plane.landed == true
    plane.landed = false
    return plane
  end

  private

  # Private method for generating random weather
  def generate_weather
    num = rand(11)
    num == 10 ? "stormy" : "sunny"
  end

  # Predicate method for checking hangar is full
  def full?
    hangar.length == capacity
  end    
      
end
