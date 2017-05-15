class Weather
  attr_reader :weather
  srand 8900

  def stormy?
    @weather = rand(0..1) == 1 ? true : false
  end

end
