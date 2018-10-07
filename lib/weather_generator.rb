class WeatherGenerator
  
  def initialize(instance_of_class_random)
    @random = instance_of_class_random
  end

  def generate_weather
    num = @random.rand(10)
    num <= 3 ? "stormy" : "clear"
  end

end
