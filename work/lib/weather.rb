class Weather
  attr_reader :storm

  def weather
    # generates random storm intensity. Nums > 7 are considred 'stormy.'
    @storm = rand(10) > 7
  end
end
