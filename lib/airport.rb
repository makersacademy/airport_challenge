class Airport
  attr_reader :weather, :full, :capacity, :planes
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    #@full = false
    return @weather = "stormy" if Random.rand > 0.9
    @weather = "sunny"
  end

  def full?
    print 'YO YO'
    print planes.length
    (planes.length) == capacity
  end

  private
  attr_writer :weather, :full, :capacity, :planes

end
