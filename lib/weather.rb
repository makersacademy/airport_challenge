class Weather
  attr_accessor :stormy

  # 20% probability of stormy weather
  def chance
    rand(4)
  end

  def stormy?
    if chance == 2
      return @stormy = true
    else
      return @stormy = false
    end
  end

end
