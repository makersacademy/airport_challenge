class Weather
  attr_reader :forecast
  MOSTLY_SUNNY = [:sunny, :sunny, :stormy]

  def self.climate
    MOSTLY_SUNNY.sample
  end
end
