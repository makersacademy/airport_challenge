class Weather
  def stormy?
    forecast == :stormy
  end

  private
  
  def forecast
    n = rand(1..10)
    n == 10 ? :stormy : :sunny
  end
end
