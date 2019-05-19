class Weather

  def random
    rand(0..2)
  end

  def weather
    choice = random
    if choice.zero?
      "STORMY"
    else
      "SUNNY"
    end
  end

end
