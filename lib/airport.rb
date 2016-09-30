class Airport
  attr_reader :weather, :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = [Plane.new, Plane.new, Plane.new]
    #could use random number to generate x amount of planes?
    @capacity = DEFAULT_CAPACITY
  end

end
