class Weather
  attr_reader :conditions

  def initialize
  @conditions = [:sunny, :stormy, :rainy, :windy, :humid, :chilly, :hot]
  end

  def storm?
  index = Random.rand(7)
  @conditions[index] == :stormy
  end

end
