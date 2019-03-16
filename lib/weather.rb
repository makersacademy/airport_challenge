class Weather
  attr_accessor :status

  def initialize
    @status = generate_weather
  end

  def generate_weather
    num = rand(10)
    num == 0 ? conditions = "stormy" : conditions = "sunny"
    return conditions
  end

  def stormy?
    return true if status == "stormy"
  end

end