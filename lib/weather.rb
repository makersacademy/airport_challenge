class Weather
  def clear?
    random <= 9 ? true : false
  end

  private

  def random
    Random.rand(1..10)
  end
end
