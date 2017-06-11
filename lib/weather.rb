class Weather
  attr_accessor :forecast

  def initialize
    @forecast = [:sunny, :stormy].sample.to_s
  end
end
