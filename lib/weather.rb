# a class to randomise weather
class Weather
  def self.stormy?(weather = rand(4))
    weather.zero?
  end
end
