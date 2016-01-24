require './lib/airport.rb'


class Weather

  def initialize
    stormy?
  end

  def stormy?
    [true,false,false,false,false].sample
  end



  # This was my initial plan before a class mate
  # gave me a better idea!

  # --------------
  # WEATHER_OPTIONS = [:stormy, :ok, :ok, :ok, :ok]
  #
  # def stormy?
  #   random_weather == :stormy
  # end
  #
  # def random_weather
  #   WEATHER_OPTIONS.sample
  # end
  # --------------


end
