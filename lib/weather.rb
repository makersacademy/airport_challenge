require_relative './safety'

class Weather
  include Safety
  attr_reader :status

  def initialize
    @status = 'sunny'
    @forecast = 1
  end

  def update_weather
    if p @forecast >= 50
      @status = 'stormy'
    else
      @status = 'sunny'
    end
    forecast
    "the weather is now #{@status}"
  end

  private

  def forecast
    forecast = rand(1..100)
    @forecast = forecast
  end
  
end
