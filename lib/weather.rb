class Weather
  attr_accessor :outlook
  def initialize
    possible_weather = ["Sunny", "Stormy"]
    @outlook = possible_weather.sample
  end

  def safe?
    (@outlook != "Stormy")
  end
end
