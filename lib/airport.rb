class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 50)
    # later I want to change @planes from [] to {} to track them.
    @planes = []
    @capacity = capacity
  end

  def plane_lands(plane = '')
    @planes << plane
  end

  def plane_takes_off(*)
    @planes.pop
  end
end
