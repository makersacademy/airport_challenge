class Weather
  attr_reader :stormy

  def stormy?
    rand(10) == 0
  end
end
