class Weather

  def stormy?
     roll >= 8
  end

private

  def roll
    rand(10)
  end
end
