require './lib/Plane.rb'
require './lib/Weather.rb'


class Airport
  attr_accessor :grounded_planes, :capacity


  def initialize(capacity=20)
    @grounded_planes = []
    @capacity = capacity
  end

  def landed(plane)
    if full? == true
      raise Exception.new("Airport Full")
    else
       @grounded_planes << plane
    end
  end

  def flying(plane)
    @grounded_planes.pop
  end

  def full?
    true if @grounded_planes.length >= @capacity
  end

end
