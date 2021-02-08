require './safety'
require './air_traffic_controller'

class Weather

  def generate_weather
    @weather = ['stormy', 'sunny'].sample
  end

end
