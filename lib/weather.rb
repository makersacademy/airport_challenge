class Weather
  def weather
    @weather = %w(Sunny Stormy)
  end

  def condition
    @condition = weather.sample
  end

  # def favourable?
  #   @condition == 'Sunny'
  # end
end
