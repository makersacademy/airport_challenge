require_relative = 'plane'
require = 'weather'

class Airport

  attr_accessor :planes
  attr_reader :name, :max_capacity

  DEFAULT_CAPACITY = 34

  def initialize(max_capacity: DEFAULT_CAPACITY, name: "NoName")
    @planes = []
    @max_capacity = max_capacity
    @name = name
  end

  def approve_landing?(plane)
    check_capacity
    check_weather
    planes << plane
  end

  def approve_takeoff?(plane)
    fail "The plane is not at this airport" unless planes.include?(plane)
    check_weather
    planes.delete(plane)
  end

  def check_capacity
    fail "#{name} is full" if planes.count >= @max_capacity
  end

  def check_weather
    fail "Bad weather at #{name}, try again later" if rand(1..5) == 1
  end

end
