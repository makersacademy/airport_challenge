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
    fail 'Hangar is full' if hangar.length == capacity
    fail 'Weather is too dangerous' if conditions == "stormy"
    plane.landed = true
    hangar << plane
  end

  def take_off(plane)
  end

  private
  def generate_weather
    num = rand(11)
    if num == 10
      return "stormy"
    else
      return "sunny"
    end
  end
    
end
