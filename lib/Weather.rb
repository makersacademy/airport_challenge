class Weather

  def stormy?
    random_generator == :stormy
  end

  #private
  def weather
    num = rand(100)
    stormy == true if num <= 20
  end

end

