class Weather
  def check
    p rand(1..4)
  end

  def stormy?
    check == 4 ? true : false
  end
end
