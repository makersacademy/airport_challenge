class Weather

  def stormy?
    random > 3
  end

  def random
    rand(5)
  end

end
