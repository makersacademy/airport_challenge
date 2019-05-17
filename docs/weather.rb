class Weather
  attr_reader :weather_generator, :weather_active

  def initialize
    @weather_generator = ["sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  def rand_num
    rand(4)
  end

  def get_weather(num)
    @weather_active = @weather_generator[num]
  end

  def safe?
    return false if @weather_active == "stormy"
    true
  end
end
