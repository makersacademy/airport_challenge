class Weather
  def stormy?
    rand_num % 3 == 0 ? true : false
  end

  def rand_num()
    rand(1..100)
  end
end