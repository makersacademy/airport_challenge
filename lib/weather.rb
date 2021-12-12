class Weather
  attr_reader :forecast
  def forecast
    random = [:sunny, :stormy, :stormy].sample
  end
end
