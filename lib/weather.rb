class Weather

  def forecast
    Random.rand(5) == 1 ? :stormy : :good
  end

end
