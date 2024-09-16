class Weather
  def stormy?
    (rand_num % 10).zero?
  end

  def rand_num
    rand(1..100)
  end
end
