class Weather
  def random_num
    rand(100)
  end

  def stormy?
    true if random_num >= 85
  end
end
