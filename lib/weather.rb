class Weather

  SUNNY = 1
  STORMY = 2

  def forecast
    rand(1..2)
  end

  def is_sunny?(weather)
    if weather == SUNNY
      true
    else
      false
    end
  end

end
