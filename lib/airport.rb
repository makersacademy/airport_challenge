class Airport

  attr_accessor :planes
  attr_reader :name

  DEFAULT_CAPACITY = 34

  def initialize(max_capacity: DEFAULT_CAPACITY, name: "NoName")
    @planes = []
    @max_capacity = max_capacity
    @name = name
  end

  def bad_weather?
    #20% chances of stormy weather (1/5)
    true if rand(1..5) == 1
  end

  def full?
    planes.count >= @max_capacity
  end

end
