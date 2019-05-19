class Weather

  def random
    rand(0..2)
  end

  def weather
    choice = random
    if choice == 0
      "STORMY"
    else
      "SUNNY"
    end
  end

end
