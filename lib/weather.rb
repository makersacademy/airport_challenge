class Weather

  def stormy?
    random_value == 10 ? true : false
  end

  def random_value
    rand(10) + 1
  end

end
