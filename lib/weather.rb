class Weather
# IE if stormy is the output of the random weather sample
# def stormy?
  #     @weather = :stormy
  # end

  def random_weather
    [:stormy, :sunny, :sunny, :sunny].sample
  end

end
