class Weather

  attr_reader :weather_event
  
  def initialize
    @weather_event = [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy]
  end

  def stormy?
    @weather_event.sample
  end
end