class Airport

  attr_reader :name, :planes, :capacity

  DEFAULT_CAPACITY=10

  def initialize name, capacity=DEFAULT_CAPACITY
    @name = name
    @planes = []
    @capacity = capacity
  end

  def full
    full=false
  end

  def weather
    weather=rand(4)
    weather==1 ? 'Stormy' : 'Sunny'
  end

end