class Weather
  attr_reader :weather_generator, :weather_active

  def initialize
    @weather_generator = ["sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def rand_num
    rand(5)
  end

  def get_weather(num)
    @weather_active = @weather_generator[num]
  end

  def not_safe?
    @weather_active == "stormy"
  end
end
