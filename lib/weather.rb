class Weather
  attr_accessor :weather_conditions, :sunny

  def initialize
    @weather_conditions = [:sunny, :sunny, :sunny, :stormy].sample
  end

  def stormy?
    @weather_conditions == :stormy
  end

  def sunny?
    @weather_conditions == :sunny
  end

  def stormy_for_sure?
    true
  end

end
