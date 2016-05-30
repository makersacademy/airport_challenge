require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 3

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "The airport is at full capacity." if full?
    raise "You already landed, silly." if plane.in_air? == false
    raise "The weather is too stormy to land!" if stormy?
    @planes << plane
    plane.on_ground?
    "The plane has successfully landed."
  end

  def take_off(plane)
    raise "You already took off, silly." if plane.in_air? == true
    raise "The weather is too stormy to take off!" if stormy?
    raise "There are no planes at the airport." if empty?
    @planes.pop
    plane.lift_off
    "The plane has successfully taken off."
  end

  def stormy?
    rand(10) < 2 ? true : false
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
