class Weather
  def initialize
    @weather    
  end
  
  def random_weather
    @weather = ['sunny', 'stormy'].shuffle.sample
  end
end
