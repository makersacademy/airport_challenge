class Weather

  attr_reader :predictions
  
  def initialize 
    @predictions = [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy, :stormy]
  end

  def random_weather
    predictions[rand(0..9)]
  end

  def stormy?
    random_weather == :stormy
  end

  def sunny?
    random_weather == :sunny
  end
end