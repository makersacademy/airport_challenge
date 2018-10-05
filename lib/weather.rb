class Weather
  def seed
    rand()
  end
  def check
    seed >= 0.2 ? "sunny" : "stormy"
  end
end
