class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def weather_is_stormy?
    #20% chances of stormy weather (1/5)
    true if rand(1..5) == 1
  end

  

end
