class Weather
  attr_reader :weather_generator

  def initialize
    @weather_generator = ["sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def rand_num
    rand(5)
  end

  def not_safe?
    @weather_generator[rand_num] == "stormy"
  end
end
