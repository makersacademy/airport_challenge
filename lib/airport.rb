require 'plane'
require 'weather'

class Airport
  include Weather

  attr_reader :storage, :capacity, :name
  DEFAULT_CAPACITY = 20
  

  def initialize(capacity = DEFAULT_CAPACITY,name = "Heathrow")
    @storage = []
    @capacity = capacity
    @name = name
  end

  def plane_landing(plane)
    if @storage.count >= @capacity
      raise "The airport is full!"
    end
    @storage << plane
    plane.land
    plane.land_in_airport(@name)
  end

  def plane_taking_off(plane)
    raise "That plane isn't in this airport!" unless @storage.include?(plane)
    index = @storage.index plane
    @storage.delete_at(index)
    plane.left_airport(true)
    plane.take_off
  end
end
