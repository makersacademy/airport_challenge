class Weather
  def clear?
    random <= 9 ? true : false
  end

  private

  def random
    Random.rand(10) + 1
  end
end
