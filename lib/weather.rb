class Weather
  def stormy?
     roll >= 1
  end

private

  def roll
    rand(10)
  end

end
