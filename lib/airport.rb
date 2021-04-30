class Airport
  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity

  end

  attr_reader :hangar
  attr_accessor :capacity

  def land(plane)
    fail 'Cannot land during a storm' if @weather
    fail 'Airport is full' if full?()

    @hangar << plane
  end

  def take_off(plane)
    fail 'Cannot takeoff in a storm' if @weather
    
    "#{plane} has taken off."
  end

  def full?
    @hangar.length >= capacity
  end

  def storm
    # num = rand(1..10)
    # @weather = num > 4 ? true : false
    @weather = true
  end 

end
