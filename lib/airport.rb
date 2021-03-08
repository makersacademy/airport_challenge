class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 2

  def initialize(_capacity = DEFAULT_CAPACITY)
    @planes = []
    'full' if @planes.count >= DEFAULT_CAPACITY
  end



end
