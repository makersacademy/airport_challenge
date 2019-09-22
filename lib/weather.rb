class Weather

  def random
    rand(1..10)
  end

  def stormy?
    random > 7
  end
end
