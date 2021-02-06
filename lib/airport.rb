class Airport

  attr_reader :hangar, :capacity, :weather

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def hangar_full?
    self.hangar.count >= @capacity
  end

  def modify_capacity(value)
    @capacity = value
  end

end

# def generate_weather
#   weather_rand = ['sunny','sunny','sunny', 'stormy'].sample
# end
