class Weather
  def random
    Random.rand(10) + 1
  end

  def clear?
    random <= 9 ? true : false
  end
end
