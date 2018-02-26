class Weather

  def initialize
  end

  def report
    # 10% chance of stormy weather
    rand() <= 0.9 ? "sunny" : "stormy"
  end

end
