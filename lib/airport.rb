require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  attr_accessor :capacity, :conditions

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    weather = generate_weather
    @conditions = weather
  end

  def land_plane(plane)
    fail 'Hangar is full' if full?
    fail 'Weather is too dangerous' if conditions == "stormy"

    plane.landed = true
    hangar << plane
  end

  def take_off(plane)
    fail 'Weather is too dangerous' if conditions == "stormy"
    fail 'That plane is not in the hangar' unless hangar.include?(plane)
    
    hangar.delete(plane) if plane.landed == true
    plane.landed = false
    return plane
  end

  private

  def generate_weather
    num = rand(11)
    num == 10 ? "stormy" : "sunny"
  end

  def full?
    hangar.length == capacity
  end    
      
end
