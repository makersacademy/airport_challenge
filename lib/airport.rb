class Airport
  attr_reader :capacity
  attr_accessor :planes
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Airport full, go away." if airport_full?
    raise "No landing in stormy weather." if Weather.new.bad?

    @planes << plane
    "Landing!"
  end

  def take_off(plane)
    raise "That plane is not here." unless @planes.include?(plane)
    raise "No flying in stormy weather." if Weather.new.bad?

    @planes.delete(plane)
    "I, #{plane}, have taken off."
  end

  private

  def airport_full?
    @planes.count >= @capacity
  end

end
