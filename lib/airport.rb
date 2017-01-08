class Airport

attr_accessor :planes, :stormy, :full

  def initialize(capacity = 5)
    @planes = []
    @stormy = false
    @capacity = capacity
  end

  def full
    @planes.length == @capacity
  end

end
