class Airport

  DEFAULT_CAPACITY = 20

  def initialize(name = 'airport', capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = [] # CHANGE TO A HASH
  end

  attr_reader :name

  attr_reader :capacity

  attr_reader :planes

  def land(plane)
    fail "The weather is too stormy to land" if stormy?
    fail "#{name} is too full to land" if full?
    plane.make_airport(self)
    @planes.push(plane)
    puts "#{plane.name} landed at #{name}"
  end

  def take_off(plane)
    fail "The weather is too stormy to take off" if stormy?
    # FIND A WAY TO NOT USE POP, BUT REMOVE SPECIFIC PLANE (HASH)
    puts "#{plane.name} took off from #{name}"
    plane.make_airport(nil)
  end

  def stormy?
    roll = rand(1..10)
    return true if roll == 10
  end

  def full?
    return true if @planes.length >= @capacity
  end
end
