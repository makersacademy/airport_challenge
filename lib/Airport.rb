class Airport
  DEFAULT_CAPACITY = 10
  def weather
    @weather = ['stormy', 'stormy', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'sunny', 'stormy']

    @weather[rand(12)]
  end

  def initialize 
    @holding = []
    @capacity = DEFAULT_CAPACITY
  end 

  def capacity(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @capacity
  end

  def land(plane)
    fail 'Airport holding is full' if @holding.count == @capacity
    @holding << plane
  end

  def take_off(plane)
    fail 'Weather condition bad cannont take off' if self.weather == 'stormy'
    @holding.delete(plane)
  end

  attr_reader :holding
end