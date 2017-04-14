class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "The airport is full" if full?
    @planes << plane
  end

  def take_off
    fail "There are no planes" if @planes.empty?
    @planes
  end

  #private

  def full?
    @planes.count >= DEFAULT_CAPACITY ? true : false
  end

end
