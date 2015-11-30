class Weather

  attr_reader :condition

  def stormy?
    random_weather ==  :stormy
  end

private

  def random_weather
    @condition = [:sunny, :overcast, :stormy].shuffle.first
  end

end
