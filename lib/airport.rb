class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :planes

  def initialize (capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []
  end

  def land plane
  	fail 'The airport is full!' if @planes.count == @capacity
    @planes<<plane
    
  end

  def take_off plane
    @planes.pop
  end

end
