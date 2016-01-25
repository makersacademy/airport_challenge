require './lib/Plane.rb'


class Airport
  attr_accessor :grounded_planes, :capacity, :sunny

  def initialize(capacity=20)
    @grounded_planes = []
    @capacity = capacity
    @sunny == true if rand(1..2) == 2
  end

  def landed(plane)
    raise Exception.new("Airport Full") if full? == true
    raise Exception.new("Too stormy to land") if sunny? == false
    @grounded_planes << plane
  end

  def flying(plane)
    raise Exception.new("Too stormy to take off") if sunny? == false
    @grounded_planes.pop
  end

  def full?
    true if @grounded_planes.length >= @capacity
  end

  def sunny?
   @sunny == false
  end
end