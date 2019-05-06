class Weather
  def stormy?
    random_num == 5
  end

  def random_num
    [1, 2, 3, 4, 5].sample
  end
end
