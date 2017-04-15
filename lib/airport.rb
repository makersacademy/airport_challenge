require_relative 'plane'

class Airport

  attr_accessor :weather, :name, :runway, :capacity

  def initialize(name = 'the Airport', cap = 10)
    @name = name
    @runway = []
    @capacity = cap
    rand(1..10) >= 9 ? @weather = "Stormy" : @weather = "Sunny"
    joke
  end

  def land_plane(plane)
    @runway << plane
  end

  def takeoff_plane(plane)
    @runway.delete(plane)
  end

  def full?
    runway.count >= capacity ? true : false
  end

  private

  def joke
    @weather = "Always Sunny" if @name == "Philadelphia"
  end

end
