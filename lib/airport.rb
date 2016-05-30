require_relative 'plane.rb'

class Airport

  attr_reader :landed_planes, :capacity

  DEFAULT_CAPACITY = 8

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes =[]
    @capacity = capacity
  end

  def land(plane)
    fail "Too stormy to land!" if stormy?
    fail "The airport is full!" if full?
    fail "This plane has already landed" if plane.landed?
    plane.land
    landed_planes << plane
    "The plane has now landed"
  end

  def take_off(plane)
    fail "Too stormy to take-off!" if stormy?
    fail "There are no planes available for take off" if empty?
    @landed_planes.pop
    "The plane has taken off"
  end

  def in_airport?(plane)
    @landed_planes.include? plane
  end

 private 

  def empty?
    true if @landed_planes.empty?
  end

  def full? 
    true if @landed_planes.length >= capacity
  end

  def stormy?
    #rand(1..6) > 4
  end

end






