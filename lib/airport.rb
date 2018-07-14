class Airport

  def initialize(name = 'airport')
    @name = name
  end

  attr_reader :name

  def land(plane)
    fail "The weather is too stormy to land" if stormy?
    plane.make_airport(self)
    puts "#{plane.name} landed at #{name}"
  end

  def take_off(plane)
    fail "The weather is too stormy to take off" if stormy?
    puts "#{plane.name} took off from #{name}"
    plane.make_airport(nil)
  end

  def stormy?
    roll = rand(1..10)
    return true if roll == 10
    false
  end
end
