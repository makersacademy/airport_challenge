class Weather

WEATHER = ["stormy", "fine", "fine", "fine"]

  def stormy?
    random_pick == "stormy"
  end

  def random_pick
    WEATHER.sample
  end

end
