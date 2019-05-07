# This is the weather class

class Weather
 
  attr_writer :condition
  # weather_conditions = ["Sunny", "Cloudy", "Stormy", "Raining", "Snowing"]

  def initialize(condition = "Sunny")
    @condition = condition
  end

  def stormy?
    @condition.eql?("Stormy") ? true : false
  end
end
