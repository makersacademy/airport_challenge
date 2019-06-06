class Weather

  attr_reader :conditions

  def initialize
    @conditions = ["sunny", "stormy"]
  end

  def generate_weather
    @conditions[rand]
  end
end
