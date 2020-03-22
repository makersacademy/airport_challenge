class Weather
  attr_reader :forecast
  MOSTLY_SUNNY = [:sunny, :sunny, :stormy]

  def climate
    MOSTLY_SUNNY.sample
  end
end
