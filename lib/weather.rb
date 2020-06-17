class Weather
  def check
    rand(1..4)
  end

  def stormy?
    check == 4
  end
end
