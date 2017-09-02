class Airport

  attr_accessor :planes, :landed

  def initialize
    @landed = false
    @planes  = []
  end

  def land(plane)
    fail "You can't land this plane again!" if @landed == true
    @planes << plane
    @landed = true
  end

  def depart(plane)
    @planes.pop
    @landed= false
  end
end

#What if there are multiple planes?
#Use an array --> multiple planes
