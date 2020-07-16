class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def dock(plane)
    return fail 'Airport full, cannot accept planes' if full?
    
    @planes << plane
  end

  private
  def full?
    # @planes.size == @capacity ? true : false    => rubocop replaces by
    @planes.size == @capacity
  end

  def empty?
    @planes.empty?
  end

end
