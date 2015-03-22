class Airport
  attr_reader :planes, :capacity
  def initialize
    @planes = []
    @capacity = 200
    @landed = false

  end

  def land plane
    fail 'Airport full. Please stand by, over...' if full?
    fail 'Adverse weather. Please stand by, over...' if weather? == 'stormy'
    fail 'You cannot land a plane that\'s already landed' if plane.status == 'landed'
    @planes << plane
    plane.land
  end

  def full?
    @planes.length >= 200
  end

  def weather?
    rand(10) < 7 ? 'stormy' : 'sunny'
  end
end
