class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 5

  def initialize(_capacity = DEFAULT_CAPACITY)
    @planes = []
  end

  def full?
    @full = true
  end
end
