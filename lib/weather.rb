require_relative 'airport'

class Weather


# def initialize
#   @weather = weather
# end

def stormy?
  random_weather == :stormy
end

private

FORECAST = [:sunny, :stormy]

def random_weather
  FORECAST.sample
end


end