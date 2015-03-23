class Airport
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def agree_land plane
    fail 'Airport is full' if full?
    @planes << plane
    nil
  end

  private

  attr_reader :planes

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end
end
