class Weather

  SUNNY = 1
  STORMY = 2

  def forecast
    rand(1..2)
  end

  def sunny?(weather)
    weather == SUNNY
  end

end
