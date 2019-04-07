class Weather

  def stormy?
    forecast == 1
  end

  private

  def forecast
    rand(1..4)
  end

end
