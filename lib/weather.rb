class Weather
  def seed
    rand()
  end
  def check
    if seed >= 0.2
      "sunny"
    else
      "stormy"
    end
  end
end
