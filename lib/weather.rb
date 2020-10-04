module Weather

attr_reader :forecast

  def weather_rand
    @random_num = (0..50).to_a.sample
    weather_forecaster
  end

  def weather_forecaster
     @random_num == 20 ? @forecast = "Stormy" : @forecast = "Clear"
   end

end
