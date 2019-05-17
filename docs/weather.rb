class Weather
  attr_reader :weather_generator

  def initialize
    @weather_generator = ["sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def rand_num
    rand(4)
  end
end
