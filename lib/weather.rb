require_relative 'airport'

class Weather
  attr_reader :weather_selection, :current_weather
  attr_accessor :weather_selection, :current_weather

  def stormy_currently?
    weather_selection == 'stormy' ? true : false
  end

  #private

  def weather_selection
    #['sunny','sunny','foggy','foggy','breezy','breezy','stormy'].sample
    ['stormy'].sample
  end
end
