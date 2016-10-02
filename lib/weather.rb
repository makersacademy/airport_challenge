class Weather

#random weather forecast 0 = stormy 10 = Sunny
  def stormy?
    roll == 0
  end

  private

  def roll
    rand(10)
  end

end
