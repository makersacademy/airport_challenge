class Weather

  def initialize
    @weather_now = [:clear, :clear, :clear, :clear, :stormy].sample
  end
  attr_accessor :weather_now
end
