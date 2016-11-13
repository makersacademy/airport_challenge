require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_accessor :capacity

  def initialize(capacity = 100)
    @planes = []
    @capacity = capacity
  end

  def stormy?
    Weather.new.condition == "Stormy" ? true : false
  end

  def plane_count
    @planes.count
  end

  def accept_plane(plane)
    raise "Error: Stormy weather is preventing the plane from landing" if stormy?
    raise "Error: The airport is full!" if full?
    @planes << plane
    "A plane has landed!"
  end

  def release_plane(plane)
    raise "Error: Stormy weather is preventing the plane from taking off" if stormy?
    raise "Error: The airport is empty!" if empty?
    @planes.pop
    "A plane has taken off!"
  end

  def full?
    plane_count >= @capacity ? true : false
  end

  def empty?
    plane_count == 0 ? true : false
  end

end
