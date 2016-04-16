class Weather
 attr_reader :weather
  def stormy?
     roll >= 6
  end

private

  def roll
    rand(10)
  end

end
