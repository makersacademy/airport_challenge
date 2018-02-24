class Weather
  attr_reader :current_weather
  def initialize
    sn, st = 'sunny', 'stormy'
    @current_weather = [sn, sn, sn, sn, sn, st].sample
  end
end
