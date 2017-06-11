class Weather

  @@weather_conditions = ["partly cloudy", "cloudy", "partly sunny", "sunny", "windy", "stormy"]

  attr_reader :condition

  def self.weather_conditions
    @@weather_conditions
  end

  def initialize
    @condition = @@weather_conditions.sample
    puts "The current weather is #{@condition}"
  end

  def current_weather
    @condition
  end
end
