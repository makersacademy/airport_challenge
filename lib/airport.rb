class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 5

  def initialize(_capacity = DEFAULT_CAPACITY)
    @planes = []
    @planes
    if @planes.count >= DEFAULT_CAPACITY
      'full'
    end
  end

end
