class Airport
  attr_reader :capacity
  attr_accessor :hangar
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Airport full, go away." if airport_full?
    raise "No landing in stormy weather." if Weather.new.bad?

    @hangar << plane
    "Landing!"
  end

  def take_off(plane)
    raise "That plane is not here." unless @hangar.include?(plane)
    raise "No flying in stormy weather." if Weather.new.bad?

    @hangar.delete(plane)
    "I, #{plane}, have taken off."
  end

  private

  def airport_full?
    @hangar.count >= @capacity
  end

end
