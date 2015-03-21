class Weather
  def forecast
    rand(1..5) < 5 ? :sunny : :stormy
  end
end
