class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 50)
    # later I want to change @planes from [] to {} to track them.
    @planes = []
    @capacity = capacity
  end

  def plane_lands(plane = '')
    (@planes.length == capacity) ? (fail 'airport full') : @planes << plane
  end

  def plane_takes_off(*)
    @planes.pop
  end

  def full?
    @planes.length == capacity
  end

  def weather
    # for the purpose of the test, it's 50-50 for now.
    (rand(10) >= 5) ? 'stormy' : 'sunny'
  end
end
